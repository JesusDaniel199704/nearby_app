import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Geolocator_bloc.dart';

class LocationContent extends StatelessWidget {
  final TextEditingController controller;
  ScrollController scrollController = ScrollController();
  final GeolocatorState state;
  LocationContent(this.state, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
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
                  if (!state.hasGpsEnabled)
                    Container(
                      color: Colors.red.withOpacity(0.8),
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      child: const Text(
                        'GPS is disabled. Please enable location services.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (!state.hasInternetConnection)
                    Container(
                      color: Colors.orange.withOpacity(0.8),
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      child: const Text(
                        'No internet connection.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: 16.r, bottom: 8.r, right: 8.r, left: 8.r),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0.r)),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0.r)),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
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
                  ),
                  if (state.isExpanded)
                    Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Container(
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
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: state.availableCategories
                                  .map((String category) {
                                return FilterChip(
                                  label: Text(category),
                                  selected:
                                      state.selectedFilters.contains(category),
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
                      ),
                    ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200.h,
                    ),
                    child: state.query.isNotEmpty &&
                            state.tempNearbyPlaces?.length != null
                        ? ListView(
                            children: List.generate(
                              state.tempNearbyPlaces!.length,
                              (index) {
                                final categorie =
                                    state.tempNearbyPlaces![index].categories;

                                if (categorie == null || categorie.isEmpty) {
                                  return const SizedBox();
                                }
                                return Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.r),
                                  child: ListTile(
                                    title:
                                        Text(categorie.first.pluralName ?? ''),
                                    subtitle:
                                        Text(categorie.first.shortName ?? ''),
                                    onTap: () async {
                                      controller.clear();
                                      final latitude = state
                                          .tempNearbyPlaces![index]
                                          .geocodes!
                                          .main!
                                          .latitude;
                                      final longitude = state
                                          .tempNearbyPlaces![index]
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
                        : SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
