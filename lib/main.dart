import 'package:flutter/material.dart';
import 'src/presentation/views/splash_screen.dart';

void main() {
  runApp(const SpoonacularApp());
}

class SpoonacularApp extends StatelessWidget {
  const SpoonacularApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
