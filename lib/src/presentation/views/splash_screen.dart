import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const int splashScreenDuration = 4500;
  static const int splashScreenAnimationDuration = 4;
  static const double splashIconSize = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: const HomePage(),
        splash: Lottie.asset(
          Assets.splashScreenPath,
          reverse: false,
        ),
        duration: splashScreenDuration,
        backgroundColor: Colors.white,
        splashIconSize: splashIconSize,
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(
          seconds: splashScreenAnimationDuration,
        ),
      ),
    );
  }
}
