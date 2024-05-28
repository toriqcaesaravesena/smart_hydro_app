// lib/screens/monitor_nutrisi_screen.dart
// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/viewmodels/control_provider.dart';
import 'package:smart_hydro_application/viewmodels/monitoring_provider.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class MonitorNutrisiScreen extends StatefulWidget {
  const MonitorNutrisiScreen({super.key});

  @override
  State<MonitorNutrisiScreen> createState() => _MonitorNutrisiScreenState();
}

class _MonitorNutrisiScreenState extends State<MonitorNutrisiScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MonitorProvider>(context, listen: false).fetchNutrisi();
    Provider.of<ControlProvider>(context, listen: false).fetchNutrisiSensor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<MonitorProvider>(context, listen: false).fetchNutrisi();
    Provider.of<ControlProvider>(context, listen: false).fetchNutrisiSensor();
  }

  @override
  Widget build(BuildContext context) {
    final nutrisi = Provider.of<MonitorProvider>(context);
    final nutrisiSensor = Provider.of<ControlProvider>(context);

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
        body: nutrisi.nutrisiMonitor != null
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
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                            //   child: Center(
                            //     child: Container(
                            //       width: 200,
                            //       height: 200,
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(25),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.grey.withOpacity(0.5),
                            //               spreadRadius: 3,
                            //               blurRadius: 7,
                            //               offset: const Offset(0, 3),
                            //             )
                            //           ]),
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         vertical: 20, horizontal: 20),
                            //     child: Column(
                            //       children: [
                            //         const Image(
                            //             image: AssetImage(
                            //                 "assets/icons/hd/nutrisi.png")),
                            //         Text(
                            //           nutrisi.nutrisiMonitor
                            //                       .toString()
                            //                       .length >
                            //                   5
                            // //              ? "${nutrisi.nutrisiMonitor.toString().substring(0, 5)}..."
                            //               : nutrisi.nutrisiMonitor
                            //                   .toString(),
                            //           style: const TextStyle(
                            //             fontSize: 30,
                            //             fontWeight: FontWeight.w700,
                            //             color: Colors.black,
                            //             overflow: TextOverflow.fade,
                            //           ),
                            //           maxLines: 1,
                            //         ),
                            //         Text(
                            //           (nutrisi.nutrisiMonitor ?? 0) <
                            //                   0.8 *
                            //                       (nutrisiSensor
                            //                               .nutrisiSensor ??
                            //                           0)
                            // //               ? "Kurang Baik"
                            //               : "Baik",
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w700,
                            //             color: (nutrisi.nutrisiMonitor ??
                            //                         0) <
                            //                     0.8 *
                            //                         (nutrisiSensor
                            //                                 .nutrisiSensor ??
                            //                             0)
                            // //                 ? Colors.red
                            //                 : primaryColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            //   ),
                            // ),
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
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                                    "assets/icons/hd/nutrisi.png"),
                                              ),
                                              Text(
                                                nutrisi.nutrisiMonitor
                                                            .toString()
                                                            .length >
                                                        5
                                                    ? "${nutrisi.nutrisiMonitor.toString().substring(0, 5)}..."
                                                    : nutrisi.nutrisiMonitor
                                                        .toString(),
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  overflow: TextOverflow.fade,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                (nutrisi.nutrisiMonitor ?? 0) <
                                                        0.8 *
                                                            (nutrisiSensor
                                                                    .nutrisiSensor ??
                                                                0)
                                                    ? "Kurang Baik"
                                                    : "Baik",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: (nutrisi.nutrisiMonitor ??
                                                              0) <
                                                          0.8 *
                                                              (nutrisiSensor
                                                                      .nutrisiSensor ??
                                                                  0)
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
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
