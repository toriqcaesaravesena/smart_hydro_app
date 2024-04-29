import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                // ignore: prefer_const_constructors
                child: Image(image: AssetImage("assets/img/history.png"),
                width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,),),
              Container(
                /* Input History Data Controlling & Monitoring */
              ),
            ]
          )
        )
      ),
    );
  }
}