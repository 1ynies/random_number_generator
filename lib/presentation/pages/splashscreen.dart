import 'package:flutter/material.dart';
import 'dart:async';

import 'package:random_num_generator/presentation/pages/random_number_generation_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    Timer(const Duration(seconds: 3), () {
      // Navigate to the main screen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const RandomNumberGenerationScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- Your Splash Screen Content ---
            
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Random Number Generator",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Optional: Add a loading indicator
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            ),
            // ---------------------------------
          ],
        ),
      ),
    );
  }
}