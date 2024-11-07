import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Geolocator_bloc.dart';

class LocationContent extends StatelessWidget {
  final TextEditingController controller;
  final ScrollController scrollController = ScrollController();
  final GeolocatorState state;
  LocationContent(this.state, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<GeolocatorBloc>().add(ChangeMapCameraPosition(
                lng: state.position?.longitude ?? 0.0,
                lat: state.position?.latitude ?? 0.0));
          },
          child: const Icon(Icons.my_location),
        ),
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              markers: Set<Marker>.of(state.markers.values),
              mapType: MapType.normal,
              initialCameraPosition: state.cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                state.controller?.complete(controller);
              },
            ),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  searchBar(context),
                  if (!state.hasInternetConnection) connectionStatus(),
                  if (state.hasGpsEnabled) gpsStatus(),
                  if (state.isExpanded) filters(context),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200.h,
                    ),
                    child: state.query.isNotEmpty &&
                            state.nearbyPlaces?.length != null
                        ? ListView(
                            children: List.generate(
                              state.nearbyPlaces!.length,
                              (index) {
                                final categorie =
                                    state.nearbyPlaces![index].categories;

                                if (categorie == null || categorie.isEmpty) {
                                  return const SizedBox();
                                }
                                return Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.r),
                                  child: ListTile(
                                    title:
                                        Text(categorie.first.shortName ?? ''),
                                    subtitle: Text(state.nearbyPlaces![index]
                                            .location?.address! ??
                                        ''),
                                    onTap: () async {
                                      controller.clear();
                                      final latitude = state
                                          .nearbyPlaces![index]
                                          .geocodes!
                                          .main!
                                          .latitude;
                                      final longitude = state
                                          .nearbyPlaces![index]
                                          .geocodes!
                                          .main!
                                          .longitude;

                                      context
                                          .read<GeolocatorBloc>()
                                          .add(ChangeMapCameraPosition(
                                            lat: latitude!,
                                            lng: longitude!,
                                          ));
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filters(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (state.selectedFilters.isNotEmpty)
                TextButton(
                  onPressed: () {
                    context.read<GeolocatorBloc>().add(
                          UpdateFiltersEvent([]),
                        );
                  },
                  child: Text(
                    'Clear all',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: state.availableCategories.map((String category) {
              return FilterChip(
                label: Text(category),
                selected: state.selectedFilters.contains(category),
                onSelected: (bool selected) {
                  context.read<GeolocatorBloc>().add(
                        UpdateFiltersEvent(
                          selected ? [category] : [],
                        ),
                      );
                },
                selectedColor: Colors.blue.withOpacity(0.2),
                checkmarkColor: Colors.blue,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget connectionStatus() {
    return Container(
      color: Colors.orange.withOpacity(0.8),
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      child: const Text(
        'No internet connection.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget gpsStatus() {
    return Container(
      color: Colors.red.withOpacity(0.8),
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      child: const InkWell(
        child: Text(
          'GPS is disabled. Please enable location services.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container searchBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16.r, bottom: 8.r, right: 8.r, left: 8.r),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search_outlined,
                  size: 18.sp,
                ),
                suffixIcon: state.query.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          controller.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          size: 18.sp,
                        ),
                      )
                    : const SizedBox(),
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
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<GeolocatorBloc>().add(OnExpanded());
              },
              child: Icon(
                Icons.filter_list,
                size: 24.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
