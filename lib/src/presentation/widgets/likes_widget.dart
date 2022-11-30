import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';

Widget likesWidget({required int likes}) {
  const double likeIconHeightMultiplier = 0.05;
  const double likeIconContainerHeightMultiplier = 0.1;
  return Container(
    height: Get.height * likeIconContainerHeightMultiplier,
    margin: const EdgeInsets.symmetric(
      horizontal: Dimensions.backArrowMargin,
    ),
    padding: const EdgeInsets.all(Dimensions.backArrowPadding),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.withOpacity(
        Dimensions.containerBackgroundColorOpacity,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(
            Dimensions.containerShadowOpacity,
          ),
          spreadRadius: Dimensions.containerShadowSpread,
          blurRadius: Dimensions.containerShadowBlur,
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          Assets.likeIconPath,
          height: Get.height * likeIconHeightMultiplier,
        ),
        Text(
          likes.toString(),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
