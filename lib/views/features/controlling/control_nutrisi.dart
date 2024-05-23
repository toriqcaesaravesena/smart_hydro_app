// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ControlNutrisiScreen extends StatefulWidget {
  const ControlNutrisiScreen({super.key});

  @override
  State<ControlNutrisiScreen> createState() => _ControlNutrisiScreenState();
}

class _ControlNutrisiScreenState extends State<ControlNutrisiScreen> {
  final TextEditingController _inputJumlahNutrisi = TextEditingController();

  var nutrisiSensor;

  @override
  void initState() {
    super.initState();
    fetchNutrisiSensor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchNutrisiSensor();
  }

  Future<void> fetchNutrisiSensor() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        nutrisiSensor = data['Nutrisi']['sensor'];
      });
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> storeNutrisiValue(int value) async {
    try {
      final response = await http.patch(
        Uri.parse(
            'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/Nutrisi.json'),
        body: jsonEncode({"kontrol": value}),
      );
      if (response.statusCode == 200) {
        log('Nutrisi value stored successfully: $value');
      } else {
        log('Failed to store nutrisi value: ${response.statusCode}');
      }
    } catch (error) {
      log('Error storing nutrisi value: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kontrol Nutrisi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: nutrisiSensor != null
          ? SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Column(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              "assets/icons/hd/nutrisi.png")),
                                      Text(
                                        "${nutrisiSensor}ppm",
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const Text(
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
                          const Center(
                              child: Text("Masukan jumlah nutrisi",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey))),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90),
                            child: TextField(
                              controller: _inputJumlahNutrisi,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 4,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 1.0),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                final value =
                                    int.tryParse(_inputJumlahNutrisi.text);
                                if (value != null) {
                                  storeNutrisiValue(value);
                                } else {
                                  log('Invalid input!');
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: primaryColor,
                                side: const BorderSide(
                                  color: darkGreenColor,
                                ),
                              ),
                              child: const Text(
                                "          Ok          ",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
