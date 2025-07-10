import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/firebase_options.dart';
import 'package:waste_management_system/user_components/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await NotificationsService().requestForNotificationPermission();
  // await NotificationsService().initializeLocalNotification();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF47DE47),
          primary: const Color(0xEF618535),
          onPrimary: Colors.white,
          secondary: const Color(0xFF8C8C8C),
          onSecondary: Colors.white,
        ),
      ),
      home: const SplashScreen(),
      // AnimatedSplashScreen(
      //   splash: Image.asset('assets/images/garbage-truck.png'),
      //   nextScreen: const LoginScreen(),
      //   duration: 5000,
      //   splashTransition: SplashTransition.fadeTransition,
      // ),
    );
  }
}
