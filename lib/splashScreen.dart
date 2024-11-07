import 'package:flutter/material.dart';
import 'package:nearby_app/injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    _initializeApp();
    _isLoading = false;
  }

  Future<void> _initializeApp() async {
    await configureDependencies();
    Navigator.pushReplacementNamed(context, 'location');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
