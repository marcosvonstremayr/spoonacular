import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/config/scroll_behaviour.dart';
import 'src/core/utils/assets_constants.dart';
import 'src/config/dependencies.dart';
import 'src/config/routes/routes.dart';
import 'src/core/utils/string_constants.dart';

void main() {
  Dependencies().onInit();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SpoonacularApp());
}

class SpoonacularApp extends StatelessWidget {
  const SpoonacularApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StringConstants.splashScreenRoute,
      routes: Routes.getRoutes(),
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontFamily: Assets.fontFamily,
            ),
      ),
    );
  }
}
