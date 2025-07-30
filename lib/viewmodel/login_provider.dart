import 'package:flutter/material.dart';
import 'package:task/model/model.dart';
import 'package:task/service/login_service.dart';

class LoginProvider extends ChangeNotifier {
  LoginService service = LoginService();
  LoginModel? loginUser;

  Future<void> logApiProvider(String email, String password) async {
    try {
      loginUser = await service.loginApiService(email, password);
      notifyListeners();
    } catch (e) {
      throw Exception('LogProvider error: $e');
    }
  }
}
