import 'package:flutter/material.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthService _authService = AuthService();

  UserModel? get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _authService.getUserDetails();
    _user = user;
    notifyListeners();
  }
}