import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task/model/model.dart';

class ProfileService {

  Dio dio = Dio();
  String Url = "https://api.escuelajs.co/api/v1/auth/profile";

  Future<LoginModel?> ProfileApiService(String token)async{
    try {
      final responseToken = await dio.get(Url,options: Options(headers: {
        'Authorization':'Bearer $token'
      }));
      if (responseToken.statusCode == 200) {
        return LoginModel.fromJson(responseToken.data);
      }
      log('response toke : $responseToken');
    } catch (e) {
      throw Exception('Not get Profile:$e');
    }
  }
}