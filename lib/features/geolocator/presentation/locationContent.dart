import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Location_bloc.dart';
import 'package:nearby_app/main.dart';

class LocationContent extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  LocationState state;
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
                    .read<LocationBloc>()
                    .add(OnCameraMove(cameraPosition: position));
              },
              mapType: MapType.normal,
              initialCameraPosition: state.cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                state.controller?.complete(controller);
              },
            ),
            Container(
              margin: EdgeInsets.all(16.r),
              child: TextField(
                controller: _controller,
                onChanged: (query) {
                  context
                      .read<LocationBloc>()
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
                      onTap: () {
                        context.read<LocationBloc>().add(NotSearching());
                      },
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
            Center(
              child: Visibility(
                visible: false,
                child: Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    height: 300.h,
                    child: state.nearbyPlaces?.length != null
                        ? ListView.builder(
                            itemCount: state.nearbyPlaces!.length,
                            itemBuilder: (context, index) {
                              final location = state.nearbyPlaces![index]
                                  .results![index].location;
                              return ListTile(
                                title: Text(location?.region ?? ''),
                                subtitle: Text(location?.region ?? ''),
                              );
                            },
                          )
                        : Container(
                            color: Colors.transparent,
                          ),
                  ),
                ),
              ),
            ),
            state.isModalVisible && state.selectedMarker != null
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 420.h,
                      padding: EdgeInsets.all(16.sp),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: SingleChildScrollView(
                          child: placeDetails(context),
                        ),
                      ),
                    ),
                  ).animate().fadeIn().slideY(
                      begin: 100,
                      end: 0,
                      duration: 500.ms,
                      curve: Curves.easeInOut,
                    )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget placeDetails(
    BuildContext context, {
    String? name,
    String? review,
    String? typePlace,
    String? until,
    String? menu,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              context.read<LocationBloc>().add(OnCloseModal());
            },
            child: Icon(
              Icons.clear,
              size: 18.sp,
            ),
          ),
        ),
        Text(
          name ?? 'Savory SuperFoods',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0.r),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 14,
                  ),
                  Text(
                    review ?? '4.5',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0.r),
              child: Text(
                typePlace ?? 'Restaurant',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0.r),
              child: Text(
                until ?? "Open 9:00 AM - 9:00 PM",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.r),
              child: Text(
                menu ?? "Suggested",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            menuCard()
          ],
        ),
      ],
    );
  }

  Widget menuCard({String? icon, String? item, String? itemDescription}) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0.r),
          child: Image.asset(
            icon ?? "assets/img/plato2.jpeg",
            scale: 3.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item ?? "Salted Beef",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  itemDescription ??
                      "Beef loin, red onion, tomato, yellow chili, soy sauce, vinegar, fresh cilantro, french fries, white rice.",
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
