import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';

Widget backArrow() {
  return InkWell(
    child: Container(
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
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    onTap: () => Get.offAllNamed(StringConstants.homeRoute),
  );
}
