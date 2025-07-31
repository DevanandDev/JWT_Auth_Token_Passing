import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/viewmodel/login_provider.dart';
import 'package:task/viewmodel/profile_provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(builder: (context, value, child) {
        return Column(
          children: [
                Text(value.accessToken?.email ?? "no value")
          ],
        );
      },),
    );
  }
}