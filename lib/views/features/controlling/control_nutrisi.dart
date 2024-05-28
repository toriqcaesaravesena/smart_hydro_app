// ignore_for_file: avoid_unnecessary_containers

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/viewmodels/control_provider.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class ControlNutrisiScreen extends StatefulWidget {
  const ControlNutrisiScreen({super.key});

  @override
  State<ControlNutrisiScreen> createState() => _ControlNutrisiScreenState();
}

class _ControlNutrisiScreenState extends State<ControlNutrisiScreen> {
  final TextEditingController _inputJumlahNutrisi = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ControlProvider>(context, listen: false).fetchNutrisiSensor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ControlProvider>(context, listen: false).fetchNutrisiSensor();
  }

  @override
  Widget build(BuildContext context) {
    final nutrisiProvider = Provider.of<ControlProvider>(context);

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
      body: nutrisiProvider.nutrisiSensor != null
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
                          //       child: Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             vertical: 20, horizontal: 20),
                          //         child: Column(
                          //           children: [
                          //             const Image(
                          //                 image: AssetImage(
                          //                     "assets/icons/hd/nutrisi.png")),
                          //             Text(
                          //               nutrisiProvider.nutrisiSensor == 0
                          //     //              ? "Silakan Masukan"
                          //                   : "${nutrisiProvider.nutrisiSensor}",
                          //               style: TextStyle(
                          //                 fontSize:
                          //                     nutrisiProvider.nutrisiSensor == 0
                          //      //                   ? 20
                          //                         : 30, // Adjust size here
                          //                 fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //             const Text(
                          //               "Nutrisi/PPM",
                          //               style: TextStyle(
                          //                   fontSize: 20,
                          //                   fontWeight: FontWeight.w700,
                          //                   color: Colors.grey),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
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
                                                  "assets/icons/hd/nutrisi.png"),
                                            ),
                                            Text(
                                              nutrisiProvider.nutrisiSensor == 0
                                                  ? "Silakan Masukan"
                                                  : "${nutrisiProvider.nutrisiSensor}",
                                              style: TextStyle(
                                                fontSize: nutrisiProvider
                                                            .nutrisiSensor ==
                                                        0
                                                    ? 20
                                                    : 30, // Adjust size here
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const Text(
                                              "Nutrisi/PPM",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey,
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
                                  nutrisiProvider.storeNutrisiValue(value);
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
