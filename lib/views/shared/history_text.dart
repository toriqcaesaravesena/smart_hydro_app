import 'package:flutter/material.dart';

class HistoryText extends StatelessWidget {
  const HistoryText({
    super.key,
    required this.status,
    required this.time,
  });

  final String status;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(status, style: const TextStyle(fontSize: 16, color: Colors.white),),
        Text(time, style: const TextStyle(fontSize: 16, color: Colors.white),),
      ],
    );
  }
}