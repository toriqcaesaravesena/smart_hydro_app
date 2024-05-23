// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/utils/routes.dart';
import 'package:smart_hydro_application/viewmodels/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

UserModel? userModel;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    updateData();
    super.initState();
  }

  updateData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              child: const Image(image: AssetImage("assets/img/bg.png")),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo ${userModel?.username}",
                                style: const TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                              const Text(
                                "Yuk mulai menanam hidroponik!",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              goToProfile(context);
                            },
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                  "assets/img/profile_pictures/pp.jpg"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/img/tag_line.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Pengendalian",
                                  style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: GestureDetector(
                                        onTap: () =>
                                            goToControlNutrisi(context),
                                        child: Container(
                                          width: 172,
                                          height: 95,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20,
                                                bottom: 20,
                                                left: 10,
                                                right: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Image(
                                                    image: AssetImage(
                                                        "assets/icons/control_nutrisi.png"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10, top: 10),
                                                    child: Container(
                                                      width: 85,
                                                      height: 100,
                                                      child: const Text(
                                                        "Nutrisi Hidroponik",
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            // height: 1,
                                                            fontSize: 15,
                                                            fontFamily: "Lato",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    child: GestureDetector(
                                        onTap: () =>
                                            goToControlIntensitasCahaya(
                                                context),
                                        child: Container(
                                          width: 172,
                                          height: 95,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20,
                                                bottom: 20,
                                                left: 15,
                                                right: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Image(
                                                    image: AssetImage(
                                                        "assets/icons/control_intensitas_cahaya.png"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10, top: 10),
                                                    child: Container(
                                                      width: 85,
                                                      height: 100,
                                                      child: const Text(
                                                        "Intensitas Cahaya",
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            // height: 1,
                                                            fontSize: 15,
                                                            fontFamily: "Lato",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ), // Controlling
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Pemantauan",
                                        style: TextStyle(
                                            fontFamily: "Lato",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              goToMonitorSuhuAir(context),
                                          child: Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 15,
                                                  bottom: 10),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/icons/suhu_air.png"),
                                                    ),
                                                    Text("Suhu Air",
                                                        style: TextStyle(
                                                            fontFamily: "Lato",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900))
                                                  ]),
                                            ),
                                          ),
                                        ), //suhu air
                                        GestureDetector(
                                          onTap: () =>
                                              goToMonitorNutrisi(context),
                                          child: Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 15,
                                                  bottom: 10),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/icons/nutrisi.png"),
                                                    ),
                                                    Text("Nutrisi",
                                                        style: TextStyle(
                                                            fontFamily: "Lato",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900))
                                                  ]),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              goToMonitorIntensitasCahaya(
                                                  context),
                                          child: Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 15,
                                                  bottom: 5),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/icons/intensitas_cahaya.png"),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4),
                                                      child: Text(
                                                        "Intensitas Cahaya",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            height: 1,
                                                            fontSize: 13.5,
                                                            fontFamily: "Lato",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          ), //intensitas cahaya
                                        ) // nutrisi
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        goToHistoryDataPage(context);
                                      },
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: 10 * 5,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.history, color: Colors.white,),
                                                  Padding(
                                                    padding: EdgeInsets.only(left:5),
                                                    child: Text("History Data",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}



                                    //   Padding(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 45),
                                    //     child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceEvenly,
                                    //       children: [
                                    //         GestureDetector(
                                    //             onTap: () =>
                                    //                 goToMonitorSuhuSekitar(
                                    //                     context),
                                    //             child: Container(
                                    //               width: 110,
                                    //               height: 110,
                                    //               decoration: BoxDecoration(
                                    //                   color: secondaryColor,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           20)),
                                    //               child: const Padding(
                                    //                 padding: EdgeInsets.only(
                                    //                     left: 10,
                                    //                     right: 10,
                                    //                     top: 15,
                                    //                     bottom: 10),
                                    //                 child: Column(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .spaceBetween,
                                    //                     children: [
                                    //                       Image(
                                    //                         image: AssetImage(
                                    //                             "assets/icons/suhu_sekitar.png"),
                                    //                       ),
                                    //                       Text("Suhu Sekitar",
                                    //                           textAlign: TextAlign
                                    //                               .center,
                                    //                           style: TextStyle(
                                    //                               height: 1,
                                    //                               fontSize: 13.5,
                                    //                               fontFamily:
                                    //                                   "Lato",
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w900))
                                    //                     ]),
                                    //               ),
                                    //             )),
                                    //         GestureDetector(
                                    //           onTap: () =>
                                    //               goToMonitorKelembapanSekitar(
                                    //                   context),
                                    //           child: Container(
                                    //             width: 110,
                                    //             height: 110,
                                    //             decoration: BoxDecoration(
                                    //                 color: secondaryColor,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         20)),
                                    //             child: const Padding(
                                    //               padding: EdgeInsets.only(
                                    //                   left: 10,
                                    //                   right: 10,
                                    //                   top: 15,
                                    //                   bottom: 5),
                                    //               child: Column(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment
                                    //                           .spaceBetween,
                                    //                   children: [
                                    //                     Image(
                                    //                       image: AssetImage(
                                    //                           "assets/icons/kelembapan_sekitar.png"),
                                    //                     ),
                                    //                     Padding(
                                    //                       padding:
                                    //                           EdgeInsets.only(
                                    //                               top: 4),
                                    //                       child: Text(
                                    //                           "Kelembapan Sekitar",
                                    //                           textAlign: TextAlign
                                    //                               .center,
                                    //                           style: TextStyle(
                                    //                               height: 1,
                                    //                               fontSize: 13.5,
                                    //                               fontFamily:
                                    //                                   "Lato",
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w900)),
                                    //                     )
                                    //                   ]),
                                    //             ),
                                    //           ),
                                    //         )
                                    //       ],
                                    //     ),
                                    //   )