import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task/model/model.dart';

class LoginService {
  Dio dio = Dio();
  String url = "https://api.escuelajs.co/api/v1/auth/login";

  Future<LoginModel?> loginApiService(String email,String password)async{
    try {
      final responseData = await dio.post(url,data: {
        "email":email,
        "password":password
      });

      if (responseData.statusCode == 201) {
        log('created :$responseData');
        return LoginModel.fromJson(responseData.data);
      }
    } catch (e) {
      throw Exception('Error:$e');
      
    }
    return null;
  }
}