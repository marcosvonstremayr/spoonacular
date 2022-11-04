import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/palette.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const Home(),
      splash: Lottie.asset(
        Assets.splashScreenPath,
        reverse: false,
      ),
      duration: Dimensions.splashScreenDuration,
      backgroundColor: Colors.white,
      splashIconSize: Dimensions.splashIconSize,
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(
        seconds: Dimensions.splashScreenAnimationDuration,
      ),
    );
  }
}
