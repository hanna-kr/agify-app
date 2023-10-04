import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:agify_app/features/onboarding/presentation/welcome_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      splash: Image.asset('assets/images/agifylogo.png'),
      splashIconSize: 200,
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: MyColor.white,
      animationDuration: const Duration(milliseconds: 1500),
    );
  }
}
