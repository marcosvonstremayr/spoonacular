import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  static const double appBarSearchTextFontSize = 16;
  static const double appBarMargin = 20;
  static const double appBarPadding = 8;
  static const double appBarHeightMultiplier = 0.1;
  static const double appBarBorderRadius = 50;
  static const double appBarBoxShadowOffsetX = 0;
  static const double appBarBoxShadowOffsetY = -2;
  static const double appBarBlurRadius = 30;
  static const double appBarBlurOpacity = 0.2;
  static const double appBarHorizontalTextPadding = 15;
  static const double appBarTitleFontSize = 26;
  static const double appBarSearchFontSize = 18;
  static const double appBarSearchTextPadding = 15;
  static const double appBarSearchIconHeight = 25;

  static const String appBarSearchTitle = 'Search';
  static const String appBarTitle = 'SPOONACULAR';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        return Container(
          margin: const EdgeInsets.all(appBarMargin),
          padding: const EdgeInsets.all(appBarPadding),
          height: MediaQuery.of(context).size.height * appBarHeightMultiplier,
          decoration: BoxDecoration(
            color: Colors.grey
                .withOpacity(Dimensions.containerBackgroundColorOpacity),
            borderRadius: BorderRadius.circular(appBarBorderRadius),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(
                  appBarBoxShadowOffsetX,
                  appBarBoxShadowOffsetY,
                ),
                blurRadius: appBarBlurRadius,
                color: Colors.black.withOpacity(appBarBlurOpacity),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: appBarHorizontalTextPadding,
                    ),
                    child: Image.asset(
                      Assets.appLogoPath,
                    ),
                  ),
                  constraints.maxWidth > Dimensions.mobileMaxWidth
                      ? const Text(
                          appBarTitle,
                          style: TextStyle(
                            fontSize: appBarTitleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              InkWell(
                child: Row(
                  children: <Widget>[
                    constraints.maxWidth > Dimensions.mobileMaxWidth
                        ? const Text(
                            appBarSearchTitle,
                            style: TextStyle(
                              fontSize: appBarSearchFontSize,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: appBarSearchTextFontSize,
                      ),
                      child: Image.asset(
                        Assets.searchIconPath,
                        height: appBarSearchIconHeight,
                      ),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed(StringConstants.searchRoute),
              )
            ],
          ),
        );
      },
    );
  }
}
