import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wall/componenets/text_field.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  // user
  final currentUser = FirebaseAuth.instance.currentUser;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.grey[500],
                centerTitle: true,
                title: Text(
                  "The Wall",
                  style: TextStyle(letterSpacing: 5, shadows: [
                    Shadow(
                      blurRadius: 9,
                      offset: Offset(10, 10),
                      color: Colors.black26,
                    )
                  ]),
                ),
                // forceElevated: true,

                actions: [
                  // Title(color: Colors.black, child: Text('The Wall')),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: logout,
                      icon: Icon(
                        Icons.logout_outlined,
                      ),
                    ),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                      child: Text(
                          'Logged in as: ${currentUser?.email.toString()}'))
                ]),
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MytextField(
                  controller: textController,
                  hintText: 'Pin on the wall',
                  obsecureTExt: false),
            ),
          ),
        ],
      ),
    );
  }
}
