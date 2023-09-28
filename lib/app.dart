import 'package:agify_app/features/onboarding/presentation/splash.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Agify App', home: SplashScreen());
  }
}
