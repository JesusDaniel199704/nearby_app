import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Location_bloc.dart';

class LocationContent extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  LocationState state;
  LocationContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
            state.position?.latitude ?? 0, state.position?.longitude ?? 0),
        infoWindow: const InfoWindow(title: 'You are here'),
      ),
    };
    //   // ...state.nearbyPlaces?.expand((place) {
    //   //   return place.results?.map((e) {
    //   //     return Marker(
    //   //       markerId: MarkerId(e.fsqId ?? ''),
    //   //       position: LatLng(
    //   //         e.geocodes?.main?.longitude?.toDouble() ?? 0.0,
    //   //         e.geocodes?.main?.latitude?.toDouble() ?? 0.0,
    //   //       ),
    //   //       infoWindow: InfoWindow(title: e.name ?? ''),
    //   //     );
    //   //   }) ?? Iterable.empty(); // Return an empty Iterable if results is null
    //   // })?.toList() ?? []
    // };
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
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
          Center(
            child: Container(
                color: Colors.transparent,
                height: 300,
                child: Flexible(
                  flex: 1,
                  child: state.nearbyPlaces?.length != null
                      ? ListView.builder(
                          itemCount: state.nearbyPlaces!.length,
                          itemBuilder: (context, index) {
                            final location = state
                                .nearbyPlaces![index].results![index].location;
                            return ListTile(
                              title: Text(location?.region ?? ''),
                              subtitle: Text(location?.region ?? ''),
                            );
                          },
                        )
                      : Container(
                          color: Colors.transparent,
                        ),
                )),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              controller: _controller,
              onChanged: (query) {
                print("dataEnd $query");
                context
                    .read<LocationBloc>()
                    .add(OnSearchPlacesEvent(query: query));
              },
              decoration: InputDecoration(labelText: "Search Location"),
            ),
          ),
        ],
      ),
    ));
  }

  // Widget _googlePlacesAutocomplete(BuildContext context) {
  //   return Card(
  //     color: Colors.white,
  //     surfaceTintColor: Colors.white,
  //     child: Column(
  //       children: [
  //         GooglePlaceAutoComplete(
  //           controller: pickUpcontroller,
  //           hintText: 'User location',
  //           onPlaceSelected: (prediction) {
  //             // context.read<ClientMapSeekerBloc>().add(
  //             //       OnCameraMove(
  //             //         lat: double.parse(prediction.lat!),
  //             //         lng: double.parse(prediction.lng!),
  //             //       ),
  //             //     );
  //             // context.read<ClientMapSeekerBloc>().add(
  //             //       OnAutoCompletedPickUpSelected(
  //             //         lat: double.parse(prediction.lat!),
  //             //         lng: double.parse(prediction.lng!),
  //             //         pickUpDescription: prediction.description ?? '',
  //             //       ),
  //             //     );
  //             print('location Lat: ${prediction.lat}');
  //             print('location lng: ${prediction.lng}');
  //           },
  //         ),
  //         Divider(
  //           height: 1,
  //         ),
  //         GooglePlaceAutoComplete(
  //           controller: destinationController,
  //           hintText: 'Destination',
  //           onPlaceSelected: (prediction) {
  //             context.read<ClientMapSeekerBloc>().add(
  //                   OnAutoCompletedDestinationSelected(
  //                     lat: double.parse(prediction.lat!),
  //                     lng: double.parse(prediction.lng!),
  //                     destinationDescription: prediction.description ?? '',
  //                   ),
  //                 );
  //             print('Destination Lat: ${prediction.lat}');
  //             print('Destinationlng: ${prediction.lng}');
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
