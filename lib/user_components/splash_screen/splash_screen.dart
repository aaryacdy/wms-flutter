import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/login/screen/login_screen.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  //static String userAddress = "";
  @override
  ConsumerState<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

   final LocationPermissionHandler _locationHandler = LocationPermissionHandler();
  @override
  void initState(){
    super.initState();

     checkAndFetchLocation();
    //.then((_) {
    //   Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const LoginScreen(),
    //       ),
    //     ),
    //   );
    // });
  }

  Future<void> checkAndFetchLocation() async {
    await _locationHandler.checkLocationPermission();
    await _locationHandler.updateLocation(ref);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFFF7F9F9),
      child: Center(
        child: Image.asset(
          'assets/images/garbage_truck.png',
          width: 0.48 * (MediaQuery.of(context).size.width),
          height: 0.23 * (MediaQuery.of(context).size.height),
        ),
      ),
    ));
  }
}
