import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeNow extends StatelessWidget {
  TimeNow({super.key});

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat('jms').format(now),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ));
  }
}
