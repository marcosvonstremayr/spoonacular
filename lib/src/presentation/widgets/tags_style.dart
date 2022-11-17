import 'package:flutter/material.dart';

TextStyle tagsStyle(bool tag) {
  const double tagsFalseOpacity = 0.7;
  return TextStyle(color: tag ? Colors.tealAccent : Colors.white.withOpacity(tagsFalseOpacity));
}
