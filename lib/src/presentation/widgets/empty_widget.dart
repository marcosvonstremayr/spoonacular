import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';

Widget emptyWidget(BuildContext context) {

  const double emptyTextFontSize = 30;
  const String emptyText = 'We don\'t have any recipes right now, please try again later';

  return Column(
    children: <Widget>[
      LottieBuilder.asset(
        Assets.emptyLottiePath,
        height: MediaQuery.of(context).size.height *
            Dimensions.emptyErrorLottieHeightMultiplier,
      ),
      const Text(
        emptyText,
        style: TextStyle(
          fontSize: emptyTextFontSize,
          color: Colors.white,
        ),
      ),
    ],
  );
}
