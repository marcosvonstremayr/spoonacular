import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';

Widget errorWidget(
  String error,
  BuildContext context,
) {

  const double errorTextFontSize = 30;
  const String errorMessage = 'An error has occurred, the error was: ';

  return Column(
    children: <Widget>[
      Lottie.asset(
        Assets.errorLottiePath,
        height: MediaQuery.of(context).size.height *
            Dimensions.emptyErrorLottieHeightMultiplier,
      ),
      Text(
        '$errorMessage$error',
        style: const TextStyle(
          fontSize: errorTextFontSize,
        ),
      ),
    ],
  );
}
