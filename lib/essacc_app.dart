import 'package:easacc/core/config/router/router.dart';
import 'package:easacc/core/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class EssaccApp extends StatelessWidget {
  const EssaccApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Essacc',
      theme: AppTheme.appLightTheme,
      routerConfig: router,
    );
  }
}