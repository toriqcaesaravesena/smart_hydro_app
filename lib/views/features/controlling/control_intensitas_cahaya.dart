// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class ControlIntensitasCahayaScreen extends StatefulWidget {
  const ControlIntensitasCahayaScreen({super.key});

  @override
  State<ControlIntensitasCahayaScreen> createState() =>
      _ControlIntensitasCahayaState();
}

class _ControlIntensitasCahayaState
    extends State<ControlIntensitasCahayaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kontrol Intensitas Cahaya",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Image(
                image: const AssetImage("assets/img/bg.png"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimeDate(),
                        TimeNow(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              children: [
                                Image(
                                    image: AssetImage(
                                        "assets/icons/hd/kelembapan_sekitar.png")),
                                SizedBox(height: 20,),
                                Text(
                                  "Gelap",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
