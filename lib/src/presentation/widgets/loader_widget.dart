import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';

Widget loaderWidget({required double size}) {
  const double loaderAssetSizeMultiplier = 2;
  return Center(
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: Get.height * size,
          width: Get.height * size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(
              Dimensions.containerBackgroundColorOpacity,
            ),
          ),
        ),
        LottieBuilder.asset(
          Assets.loadingLottiePath,
          height: Get.height * size * loaderAssetSizeMultiplier,
        ),
      ],
    ),
  );
}
