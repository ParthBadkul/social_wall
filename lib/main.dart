import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wall/auth/loginorregister.dart';
import 'package:wall/pages/loginPage.dart';
import 'package:wall/pages/registerPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}
