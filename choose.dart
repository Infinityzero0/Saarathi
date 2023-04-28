import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/driver_signup.dart';
import 'package:flutter_demo/officier_signup_page.dart';

class ChooseUser extends StatefulWidget {
  const ChooseUser({super.key});

  @override
  State<ChooseUser> createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {
  @override
  Widget build(BuildContext context) {
    List images = ["g.png", "t.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/signup.png"), fit: BoxFit.cover)),
            child: Column(children: [
              SizedBox(
                height: h * .16,
              ),
              const CircleAvatar(
                  radius: 54,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 52,
                    backgroundImage: AssetImage("img/user.png"),
                  ))
            ]),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Select to sign up",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 50,
          ),
          /*Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("img/loginbtn.png"),
                      fit: BoxFit.cover)),
              child: const Center(
                child: Text(
                  "Police",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
              
              ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("img/loginbtn.png"),
                      fit: BoxFit.cover)),
              child: const Center(
                child: Text(
                  "Driver",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
       */

          // SizedBox(
          //   height: 60,
          //   width: 200,
          //   child: ElevatedButton(
          //     child: Text('Police',),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => SignUp()),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Color.fromARGB(255, 255, 200, 0)
          //       // Background color
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // SizedBox(
          //   height: 60,
          //   width: 200,
          //   child: ElevatedButton(
          //     child: Text('Driver'),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => DriverSignUp()),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.orange,

          //       // Background color
          //     ),
          //   ),
          // ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(
              'Police',
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[100]
                // Background color
                ),
          ),

          SizedBox(
            height: 30,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DriverSignUp()));
            },
            child: Text(
              'Driver',
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[100]
                // Background color
                ),
          ),
        ],
      ),
    );
  }
}
