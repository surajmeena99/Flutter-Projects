import 'package:flutter/material.dart';
import 'dart:async';

import 'package:apnibook_app/screens.dart/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    super.initState();
    Timer(
      const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:  (context) => const TabsScreen()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(4.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent, // Change background color as needed
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/book.jpg'),
                      fit: BoxFit.fill, // Fit the background image within the circle avatar
                    ),
                  ),
                  
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Text("Created by", style: TextStyle(color: Colors.white),),
                  Text("Suraj Meena", style: TextStyle(fontSize: 20, color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

