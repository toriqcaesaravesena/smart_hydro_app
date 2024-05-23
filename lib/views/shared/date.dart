import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // tambahkan ini untuk lokalisasi tanggal

class TimeDate extends StatelessWidget {
  TimeDate({super.key});

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id', null);

    return Text(DateFormat.yMMMMEEEEd('id').format(now),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ));
  }
}
