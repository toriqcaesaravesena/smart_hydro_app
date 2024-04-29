
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/utils/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  UserModel? userModel;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
                          children: [
                            const Image(image: AssetImage("assets/img/tag_line.png")),
                            const SizedBox(
                              height: 20,
                            ), // Article
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Controlling",
                                      style: TextStyle(
                                          fontFamily: "Lato",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: GestureDetector(
                                        onTap: () =>
                                            goToControlNutrisi(context),
                                        child: Container(
                                          width: 350,
                                          height: 110,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        "assets/icons/controlling_nutrisi.png"),
                                                  ),
                                                  Text("Nutrisi Hidroponik",
                                                      style: TextStyle(
                                                          fontFamily: "Lato",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700))
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
                                        "Monitoring",
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
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                              onTap: () =>
                                                  goToMonitorSuhuSekitar(
                                                      context),
                                              child: Container(
                                                width: 110,
                                                height: 110,
                                                decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
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
                                                              "assets/icons/suhu_sekitar.png"),
                                                        ),
                                                        Text("Suhu Sekitar",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                height: 1,
                                                                fontSize: 13.5,
                                                                fontFamily:
                                                                    "Lato",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900))
                                                      ]),
                                                ),
                                              )),
                                          GestureDetector(
                                            onTap: () =>
                                                goToMonitorKelembapanSekitar(
                                                    context),
                                            child: Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                  color: secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
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
                                                            "assets/icons/kelembapan_sekitar.png"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4),
                                                        child: Text(
                                                            "Kelembapan Sekitar",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                height: 1,
                                                                fontSize: 13.5,
                                                                fontFamily:
                                                                    "Lato",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900)),
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ), // Monitoring
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
