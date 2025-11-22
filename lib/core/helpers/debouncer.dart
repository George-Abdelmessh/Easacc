import 'dart:async';

import 'package:flutter/material.dart';

class AppDebouncer {
  AppDebouncer({required this.milliseconds});

  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  /// Run the debounced action.
  ///
  /// This method cancels any existing timer, and schedules a new timer
  /// to execute the provided [action] after the specified [milliseconds].
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
