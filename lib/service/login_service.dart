import 'package:dio/dio.dart';
import 'package:task/model/model.dart';

class LoginService {
  Dio dio = Dio();
  String Url = "https://api.escuelajs.co/api/v1/auth/login";

  Future<LoginModel?> loginApiService(String email,String password)async{
    try {
      final responseData = await dio.post(Url);

      if (responseData.statusCode == 200) {
        return LoginModel.fromJson(responseData.data);
      }
    } catch (e) {
      throw Exception('Error:$e');
    }
  }
}