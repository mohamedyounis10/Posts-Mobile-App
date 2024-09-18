// lib/screens/post_details_screen.dart
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post; // Post data passed from previous screen

  PostDetailsScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFD7),
      body: SafeArea(
        child: Column(
          children: [
            // Use Stack to overlay the back button on top of the image
            Stack(
              children: [
                // Image that fills 1/2 of the screen height
                Container(
                  height: MediaQuery.of(context).size.height * 0.5, // 1/2 of the screen height
                  width: double.infinity, // Full width
                  child: Image.asset(
                    'assets/images/img_1.png', // Replace with your image asset path
                    fit: BoxFit.cover, // Image covers the available space
                  ),
                ),
                // Positioned back button (arrow) at the top-left corner
                Positioned(
                  top: 16, // Padding from the top
                  left: 16, // Padding from the left
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30), // White arrow
                    onPressed: () {
                      Navigator.of(context).pop(); // Go back to the previous screen
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20), // Space between the image and the title
                      Text(
                        'Title:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // Space between "Title:" and the actual title
                      Text(
                        post.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20), // Space before the body content
                      Text(
                        post.body,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
