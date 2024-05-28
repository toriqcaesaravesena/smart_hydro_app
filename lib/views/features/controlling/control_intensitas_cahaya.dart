// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/viewmodels/control_provider.dart';
import 'package:smart_hydro_application/views/shared/date.dart';
import 'package:smart_hydro_application/views/shared/time.dart';

class ControlIntensitasCahayaScreen extends StatefulWidget {
  const ControlIntensitasCahayaScreen({super.key});

  @override
  State<ControlIntensitasCahayaScreen> createState() =>
      _ControlIntensitasCahayaState();
}

class _ControlIntensitasCahayaState
    extends State<ControlIntensitasCahayaScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ControlProvider>(context, listen: false)
        .fetchIntensitasCahaya();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ControlProvider>(context, listen: false)
        .fetchIntensitasCahaya();
  }

  @override
  Widget build(BuildContext context) {
    final intensitasCahayaProvider = Provider.of<ControlProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Kontrol Intensitas Cahaya",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: intensitasCahayaProvider.intensitasCahaya != null
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
                                                    "assets/icons/hd/intensitas_cahaya.png"),
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                intensitasCahayaProvider
                                                    .intensitasCahaya,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: intensitasCahayaProvider
                                                              .intensitasCahaya ==
                                                          "Gelap"
                                                      ? Colors.grey
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
                            )
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
