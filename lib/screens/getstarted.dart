import 'package:flutter/material.dart';
import 'package:postsapp/screens/home.dart';

class Getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              'assets/images/img.png',
              fit: BoxFit.cover, // Fills the screen with the image
            ),

            // Positioned button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0), // Add padding around the button
                child: SizedBox(
                  width: 320,
                  height: 52,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (c){
                          return HomeScreen();
                        })
                      );
                    },
                    color: Color(0xFFFFFFD7), // Background color of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners for the button
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18, // Font size for the button text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
