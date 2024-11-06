import 'dart:async';

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
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 10), () {
      final query = _searchController.text;
      context.read<GeolocatorBloc>().add(OnSearchPlacesEvent(query: query));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeolocatorBloc, GeolocatorState>(
        builder: (context, state) {
          return LocationContent(state, _searchController);
        },
      ),
    );
  }
}
