import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/providers/monitoring_provider.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/utils/date.dart';
import 'package:smart_hydro_application/utils/time.dart';

class MonitorSuhuAirScreen extends StatefulWidget {
  const MonitorSuhuAirScreen({super.key});

  @override
  State<MonitorSuhuAirScreen> createState() => _MonitorSuhuAirScreenState();
}

class _MonitorSuhuAirScreenState extends State<MonitorSuhuAirScreen> {


  @override
  void initState() {
    fetchSuhuAir();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    fetchSuhuAir();
    super.didChangeDependencies();
  }


  Future<void> fetchSuhuAir() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        suhuAir = data['suhu_air']['Celcius'];
      });
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Suhu Air",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
        ),
        body: suhuAir != null
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
                                                "assets/icons/hd/suhu_air.png")),
                                        Text(
                                          "$suhuAir°C",
                                          style: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          suhuAir > 30 ? "Kurang Baik" : "Baik",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: suhuAir > 30
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
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
