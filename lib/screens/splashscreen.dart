import 'dart:async';
import 'package:flutter/material.dart';
import 'package:postsapp/screens/getstarted.dart';
import 'package:postsapp/screens/home.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState() {
    super.initState();
    // Delay for 2 seconds before navigating to the home page
    Timer(
        Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Getstarted()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // You can add other widgets on top of the background image here
              Center(
                child: Text(
                  'POSTS\n  APP',
                  style: TextStyle(
                    color: Color(0xFFFFFFD7),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
