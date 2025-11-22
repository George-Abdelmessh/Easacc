import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'essacc_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Shared Preferences
  await SharedPreferencesService.init();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const EssaccApp());
}
