// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/viewmodels/monitoring_provider.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class MonitorSuhuAirScreen extends StatefulWidget {
  const MonitorSuhuAirScreen({super.key});

  @override
  State<MonitorSuhuAirScreen> createState() => _MonitorSuhuAirScreenState();
}

class _MonitorSuhuAirScreenState extends State<MonitorSuhuAirScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MonitorProvider>(context, listen: false).fetchSuhuAir();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<MonitorProvider>(context, listen: false).fetchSuhuAir();
  }

  @override
  Widget build(BuildContext context) {
    final suhuAirProvider = Provider.of<MonitorProvider>(context);
    final suhuAir = suhuAirProvider.suhuAirMonitor;

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
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double width = constraints.maxWidth * 0.6;
                                  double height = constraints.maxHeight * 0.6;
                                  if (width > 200) width = 200;
                                  if (height > 200) height = 200;

                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    child: Container(
                                      width: width,
                                      height: height,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  "assets/icons/hd/suhu_air.png"),
                                            ),
                                            Text(
                                              "$suhuAir°C",
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              suhuAir > 27
                                                  ? "Kurang Baik"
                                                  : (suhuAir < 18
                                                      ? "Kurang Baik"
                                                      : "Baik"),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    suhuAir > 27 || suhuAir < 18
                                                        ? Colors.red
                                                        : primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
