import 'package:flutter/material.dart';

class AppColor {
  /// PRIMARY COLOR IN APP
  static const Color primaryBlue = Color(0xff00086D);

  /// Dark Blue COLOR
  static const Color darkBlue = Color(0xff0A0F4B);

  /// LIGHT BLUE COLOR
  static const Color lightBlue = Color(0xff5F72FF);

  /// WHITE COLOR
  static const Color white = Color(0xffffffff);

  /// BLACK COLOR
  static const Color black = Color(0xff000000);

  /// MainTitleColor
  static const Color mainTitleColor = Color(0xff020418);

  /// GREY COLOR
  static const Color grey = Color(0xffA8AAAD);

  /// Dark GREY COLOR
  static const Color darkGrey = Color(0xff606166);

  /// LIGHT GREY COLOR
  static const Color lightGrey = Color(0xffEBECED);

  /// SCAFFOLD COLOR
  static const Color secondary = Color(0xffEEF0FF);

  /// GREEN COLOR
  static const Color green = Color(0xff75C91B);

  /// RED COLOR
  static const Color red = Color(0xffC43535);

  /// RED COLOR
  static const Color amber = Color(0xffC09300);

  /// LIGHT TEAL
  static const Color lightTeal = Color(0xff7FE2C3);

  static Color shimmerBase = Colors.grey[200]!;

  static Color shimmerHighlight = Colors.grey[300]!;

  static ColorFilter blackAndWhiteColorFilter =
      const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
}
