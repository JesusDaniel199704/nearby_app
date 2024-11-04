import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_app/blocProvider.dart';
import 'package:nearby_app/features/geolocator/presentation/locationPage.dart';
import 'package:nearby_app/features/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (BuildContext context) => const SplashScreen(),
          'location': (BuildContext context) => const LocationPage(),
        },
      ),
    );
  }
}
