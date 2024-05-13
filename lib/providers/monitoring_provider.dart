import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;


var intensitasCahaya;
var kelembabanSekitar;
var nutrisi;
var suhuAir;
var suhuSekitar;


class MonitoringProvider with ChangeNotifier {

  Future<void> fetchIntensitasCahaya() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
        intensitasCahaya = data['Nutrisi']['ppm'];
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
    notifyListeners();
  }

  Future<void> fetchKelembabanSekitar() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
        kelembabanSekitar = data['DHT']['kelembaban'];
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
    notifyListeners();
  }

  Future<void> fetchNutrisi() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
        nutrisi = data['Nutrisi']['ppm'];
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
    notifyListeners();
  }

  Future<void> fetchSuhuAir() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
        suhuAir = data['suhu_air']['Celcius'];
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
    notifyListeners();
  }

  Future<void> fetchSuhuSekitar() async {
    final response = await http.get(Uri.parse(
        'https://smart-hydro-app-2f0c8-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
        suhuSekitar = data['DHT']['suhu_ruang'];
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
    notifyListeners();
  }
}