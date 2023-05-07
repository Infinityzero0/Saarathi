import 'dart:async';

import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:driver_app/global/global.dart';
import 'package:driver_app/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
     Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Color.fromARGB(255, 253, 216, 213),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                CircleAvatar(
                  radius: 100, // adjust the size of the circle
                  backgroundImage: AssetImage("images/logo1.png"),
                ),
                
                const SizedBox(
                  height: 20,
                ),
               
                const Text(
                  "Ambulance Driver",
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 228, 89, 89),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
