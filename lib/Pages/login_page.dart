// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              LottieBuilder.asset("images/login.json"),
              Text(
                "Lets Sign you in",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "John@example.com",
                  suffixIcon: Icon(Icons.mail_outline),
                  prefixIcon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                // ! to be changed through provider
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "John@example.com",
                  // ! to be change to unlock icon
                  suffixIcon: Icon(Icons.lock_outline),
                  prefixIcon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  child: Text("New User? Click here to Register"),
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  ),
                ),
              ),
              CupertinoButton.filled(
                child: Text("Login"),
                onPressed: () => UserController().handleUserLogin(
                  emailController.text,
                  passwordController.text,
                  context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
