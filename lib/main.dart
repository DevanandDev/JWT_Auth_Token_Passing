import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view/login_screen.dart';
import 'package:task/viewmodel/login_provider.dart';
import 'package:task/viewmodel/profile_provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => ProfileProvider(),)
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: MyLogin(),
     debugShowCheckedModeBanner: false,
    );
  }
}