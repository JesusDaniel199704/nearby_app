import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Geolocator_bloc.dart';

class LocationContent extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  GeolocatorState state;
  LocationContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              markers: Set<Marker>.of(state.markers.values),
              onCameraMove: (position) {
                context
                    .read<GeolocatorBloc>()
                    .add(OnCameraMove(cameraPosition: position));
              },
              mapType: MapType.normal,
              initialCameraPosition: state.cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                state.controller?.complete(controller);
              },
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 8.r),
                  child: TextField(
                    controller: _controller,
                    onChanged: (query) {
                      // if (query.isEmpty) {
                      //   context
                      //       .read<LocationBloc>()
                      //       .add(OnSearchPlacesEvent(query: query));
                      // }
                      context
                          .read<GeolocatorBloc>()
                          .add(OnSearchPlacesEvent(query: query));
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 18.sp,
                      ),
                      suffixIcon: Container(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.clear,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 200.h,
                  ),
                  child: state.query.isNotEmpty &&
                          state.nearbyPlaces?.length != null
                      ? ListView.builder(
                          itemCount: state.nearbyPlaces!.length,
                          itemBuilder: (context, index) {
                            final categorie =
                                state.nearbyPlaces![index].categories;

                            return Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 12.r),
                              child: ListTile(
                                title: Text(categorie?.first.pluralName ?? ''),
                                subtitle:
                                    Text(categorie?.first.shortName ?? ''),
                                onTap: () async {
                                  final latitude = state.nearbyPlaces![index]
                                          .geocodes?.main?.latitude ??
                                      0.0;
                                  final longitude = state.nearbyPlaces![index]
                                          .geocodes?.main?.longitude ??
                                      0.0;

                                  context
                                      .read<GeolocatorBloc>()
                                      .add(ChangeMapCameraPosition(
                                        lat: latitude,
                                        lng: longitude,
                                      ));
                                },
                              ),
                            );
                          },
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
