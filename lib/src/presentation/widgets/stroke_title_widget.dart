import 'package:flutter/material.dart';

Widget strokeTitle({
  required String title,
  required bool isMainTitle,
}) {
  const double mainTitleFontSize = 40;
  const double subtitleFontSize = 30;
  const double strokeWidth = 3;

  return Stack(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: isMainTitle ? mainTitleFontSize : subtitleFontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = Colors.black,
        ),
        textAlign: isMainTitle ? TextAlign.center : TextAlign.start,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: isMainTitle ? mainTitleFontSize : subtitleFontSize,
          color: Colors.white,
        ),
        textAlign: isMainTitle ? TextAlign.center : TextAlign.start,
      ),
    ],
  );
}
