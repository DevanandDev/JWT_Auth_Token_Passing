import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/model/model.dart';
import 'package:task/service/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileService service = ProfileService();

  LoginModel? accessToken;

  Future<void> profileToken(String token) async {
    try {
      accessToken = await service.ProfileApiService(token);

      log('profile toke added : $accessToken');
    } catch (e) {
      throw Exception('Profile token not get:$e');
    }
  }
}
