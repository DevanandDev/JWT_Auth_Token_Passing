import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view/home.dart';
import 'package:task/viewmodel/login_provider.dart';
import 'package:task/viewmodel/profile_provider.dart';

class MyLogin extends StatefulWidget {
  MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    final profile = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          ElevatedButton(
            onPressed: () async {
              await provider.logApiProvider(
                emailController.text,
                passController.text,
              );
              if (provider.loginUser != null) {
               await profile.profileToken(provider.loginUser!.accessToken!);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (ctx) => MyHome()),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login successfull')));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed : Try again')),
              );
              }
            },
            child: Text('LogIn'),
          ),
        ],
      ),
    );
  }
}
