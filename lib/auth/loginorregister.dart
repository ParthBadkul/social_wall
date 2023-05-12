import 'package:flutter/material.dart';
import 'package:wall/pages/loginPage.dart';
import 'package:wall/pages/registerPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleBetween() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return (LoginPage(onTap: toggleBetween));
    } else {
      return (RegisterPage(onTap: toggleBetween));
    }
  }
}
