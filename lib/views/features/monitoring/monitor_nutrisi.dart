// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class MonitorNutrisiScreen extends StatefulWidget {
  const MonitorNutrisiScreen({super.key});

  @override
  State<MonitorNutrisiScreen> createState() => _MonitorNutrisiScreenState();
}

class _MonitorNutrisiScreenState extends State<MonitorNutrisiScreen> {
  Stream<Map<String, dynamic>> fetchNutrisiStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      final response = await http.get(Uri.parse(
          'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        yield data['Nutrisi'];
      } else {
        log('Failed to load data: ${response.statusCode}');
        yield {};
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nutrisi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: fetchNutrisiStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final nutrisi = snapshot.data!['sensor'];
            return SingleChildScrollView(
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
                                        "$nutrisi ppm",
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        nutrisi > 1000 ? "Kurang Baik" : "Baik",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: nutrisi > 1000
                                              ? Colors.red
                                              : primaryColor,
                                        ),
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
            );
          }
        },
      ),
    );
  }
}
