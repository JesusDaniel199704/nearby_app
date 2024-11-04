import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Location_bloc.dart';
import 'package:nearby_app/features/geolocator/presentation/locationContent.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<LocationBloc>().add(LocationInitEvent());
      context.read<LocationBloc>().add(FindPosition());
      // context.read<LocationBloc>().add(OnPlacesEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return LocationContent(state);
        },
      ),
    );
  }
}
