import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wall/auth/auth.dart';
import 'package:wall/firebase_options.dart';
// import 'package:wall/auth/loginorregister.dart';
// import 'package:wall/pages/registerPage.dart';
// import 'package:wall/auth/loginorregister.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
