import 'package:flutter/material.dart';

class AppHelper {
  /// Physics list view
  static BouncingScrollPhysics scroll = const BouncingScrollPhysics();

  /// CLOSE KEYBOARD
  static Future closeKeyboard() async {
    /// CLOSE KEYBOARD
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// CHECK IF DEVICE HAS NOTCH
  static bool hasNotch(BuildContext context) {
    // Get the top padding (safe area) of the device
    final topPadding = MediaQuery.of(context).padding.top;

    // Consider a device has a notch if the top padding is greater than a 
    //typical status bar height.
    return topPadding >
        24; // 24 is a common status bar height on devices without a notch.
  }
}
