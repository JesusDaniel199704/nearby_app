import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Geolocator_bloc.dart';
import 'package:nearby_app/features/geolocator/presentation/geolocatorContent.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<GeolocatorBloc>().add(LocationInitEvent());
      // context.read<GeolocatorBloc>().add(FindPosition());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeolocatorBloc, GeolocatorState>(
        builder: (context, state) {
          return LocationContent(state);
        },
      ),
    );
  }
}
