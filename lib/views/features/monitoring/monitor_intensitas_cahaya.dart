import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/utils/date.dart';
import 'package:smart_hydro_application/utils/time.dart';

class MonitorIntensitasCahayaScreen extends StatefulWidget {
  const MonitorIntensitasCahayaScreen({super.key});

  @override
  State<MonitorIntensitasCahayaScreen> createState() => _MonitorIntensitasCahayaScreenState();
}

class _MonitorIntensitasCahayaScreenState extends State<MonitorIntensitasCahayaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Intensitas Cahaya",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage("assets/img/bg.png"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                        "assets/icons/hd/intensitas_cahaya.png")),
                                Text(
                                  "170lux",
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Baik",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: primaryColor,
                          side: const BorderSide(
                            color: darkGreenColor,
                          ),
                        ),
                        child: const Text(
                          "          Back to Home          ",
                          style: TextStyle(color: Colors.white),
                        ))
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