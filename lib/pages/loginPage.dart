import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wall/componenets/button.dart';
import 'package:wall/componenets/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    );
    _controller.forward();
  }

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.code),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              //Logo
              const SizedBox(
                height: 0,
              ),

              GestureDetector(
                child: Center(
                  child: Lottie.network(
                      height: 280,
                      controller: _controller,
                      'https://assets5.lottiefiles.com/packages/lf20_p1ljeagm.json'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //welcome back Message
              const Center(
                child: Text(
                  'Welcome , Sign in to access the WALL',
                  style: TextStyle(letterSpacing: 2.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Email TextField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MytextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obsecureTExt: false,
                ),
              ),
              // password Text Field
              const SizedBox(
                height: 20,
              ),
              //Email TextField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MytextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureTExt: true,
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              //Sign in Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 15,
                ),
                child: Mybutton(onTap: login, text: 'Sign In'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member ? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )

              // Go to Register Button
            ]))
          ],
        ),
      ),
    );
  }
}
