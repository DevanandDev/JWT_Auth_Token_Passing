class LoginModel{
  String? email;
  String? password;
  String? accessToken;

  LoginModel({required this.email,required this.password,required this.accessToken});

  factory LoginModel.fromJson(Map<String,dynamic>jsonData){
    return LoginModel(email: 'email', password: 'password',accessToken: "access_token");
  }
}