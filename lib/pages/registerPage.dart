import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../componenets/button.dart';
import '../componenets/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
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
                      'https://assets8.lottiefiles.com/packages/lf20_TGwyPsBlNo.json'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //welcome back Message
              const Center(
                child: Text(
                  'Lets create your WALL account',
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
                height: 20,
              ),

              // re-password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MytextField(
                  controller: confirmpasswordController,
                  hintText: 'Re-Enter Password',
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
                child: Mybutton(onTap: () {}, text: 'Register Now'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an Account ? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign In Now',
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
