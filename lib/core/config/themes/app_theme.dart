import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
    useMaterial3: false,

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.lightBlue,
    ),

    primaryColor: AppColor.primaryBlue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.primaryBlue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColor.white,
    unselectedWidgetColor: Colors.white,

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.primaryBlue,
    ),

    textTheme: const TextTheme(
      bodySmall: TextStyle(height: 1.5),
      bodyMedium: TextStyle(height: 1.5),
      bodyLarge: TextStyle(height: 1.5),
    ),

    /// AppBar ThemeData
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        // fontFamily: 'CairoFont',
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      elevation: 0,
      centerTitle: true,
      titleSpacing: 20,
      backgroundColor: AppColor.primaryBlue,
    ),

    /// Drawer ThemeData
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      backgroundColor: AppColor.white,
    ),

    /// NavBar ThemeData
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColor.primaryBlue,
      unselectedItemColor: AppColor.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData getAppTheme(BuildContext context) {
      const fontFamily =  'Poppins';

    return appLightTheme.copyWith(
      textTheme: appLightTheme.textTheme.apply(fontFamily: fontFamily),
      tabBarTheme: const TabBarThemeData(
        unselectedLabelStyle: TextStyle(fontFamily: fontFamily),
        labelColor: AppColor.white,
        unselectedLabelColor: AppColor.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.transparent,
        labelStyle: TextStyle(fontFamily: fontFamily),
      ),
    );
  }
}
