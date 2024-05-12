import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/utils/date.dart';
import 'package:smart_hydro_application/utils/time.dart';

class MonitorKelembapanSekitarScreen extends StatefulWidget {
  const MonitorKelembapanSekitarScreen({super.key});

  @override
  State<MonitorKelembapanSekitarScreen> createState() => _MonitorKelembapanSekitarScreenState();
}

class _MonitorKelembapanSekitarScreenState extends State<MonitorKelembapanSekitarScreen> {
  
  var kelembabanSekitar;

  @override
  void initState() {
    super.initState();
    fetchKelembabanSekitar();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchKelembabanSekitar();
  }

  Future<void> fetchKelembabanSekitar() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      // If the request is successful, parse the response body
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Extract the data you need, you might need to adjust the key according to your Firebase structure
      setState(() {
        kelembabanSekitar = data['DHT']['kelembaban'];
      });
    } else {
      // If the request fails, print the error message
      log('Failed to load data: ${response.statusCode}');
    }
  }
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kelembapan Sekitar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: kelembabanSekitar != null ?
      SingleChildScrollView(
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                        "assets/icons/hd/kelembapan_sekitar.png")),
                                Text(
                                  "$kelembabanSekitar%",
                                  style: const TextStyle(
                                      fontSize: 36,
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
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}