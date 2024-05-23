import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; 

class TimeNow extends StatelessWidget {
  TimeNow({super.key});

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id', null);

    final wib = now.toUtc().add(const Duration(hours: 7));

    return Text(DateFormat('jm', 'id').format(wib),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ));
  }
}
