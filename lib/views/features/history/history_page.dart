import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/colors.dart';

class HistoryDataPage extends StatefulWidget {
  const HistoryDataPage({super.key});

  @override
  State<HistoryDataPage> createState() => _HistoryDataPageState();
}

class _HistoryDataPageState extends State<HistoryDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History Data",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  "Controlling Nutrisi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2.5),
                  ),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical, 
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0, top:20),
                child: Text(
                  "Monitoring Nutrisi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2.5),
                  ),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical, 
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0, top:20),
                child: Text(
                  "Monitoring Suhu Air",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2.5),
                  ),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical, 
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data1"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                          Text("data10"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
