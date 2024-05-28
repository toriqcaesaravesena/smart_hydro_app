// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ControlProvider with ChangeNotifier {
  var nutrisiSensor;
  var intensitasCahaya;

  Future<void> fetchNutrisiSensor() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      nutrisiSensor = data['Nutrisi']['kontrol'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> storeNutrisiValue(int value) async {
    try {
      final response = await http.patch(
        Uri.parse(
            'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/Nutrisi.json'),
        body: jsonEncode({"kontrol": value}),
      );
      if (response.statusCode == 200) {
        log('Nutrisi value stored successfully: $value');
      } else {
        log('Failed to store nutrisi value: ${response.statusCode}');
      }
    } catch (error) {
      log('Error storing nutrisi value: $error');
    }
  }

  Future<void> fetchIntensitasCahaya() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      intensitasCahaya = data['Cahaya']['Keadaan'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }
}
