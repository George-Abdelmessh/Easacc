import 'package:flutter/material.dart';

class AppSize {
  // Base dimensions for iPhone 14 (logical points)
  static const double _baseWidth = 390;
  static const double _baseHeight = 844;

  // Method to scale width
  static double widthScale(BuildContext context, double size) {
    final screenWidth = MediaQuery.of(context).size.width;
    return size * (screenWidth / _baseWidth);
  }

  // Method to scale height
  static double heightScale(BuildContext context, double size) {
    final screenHeight = MediaQuery.of(context).size.height;
    return size * (screenHeight / _baseHeight);
  }
}
