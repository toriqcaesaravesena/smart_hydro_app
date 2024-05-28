import 'dart:async';
import 'package:flutter/foundation.dart';

class TimeProvider with ChangeNotifier {
  DateTime _now = DateTime.now();

  TimeProvider() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _now = DateTime.now();
      notifyListeners();
    });
  }

  DateTime get now => _now;
}