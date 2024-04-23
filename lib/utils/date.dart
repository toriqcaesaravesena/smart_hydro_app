import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDate extends StatelessWidget {
  TimeDate({super.key});

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat('yMMMMEEEEd').format(now),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ));
  }
}
