import 'package:flutter/material.dart';

import 'package:flutter_demo/auth_controller.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  //int? get length => null;
   //final AuthController authController = Get.put(AuthController()); // add this line to put the AuthController instance into the GetX dependency injection system

  @override
  Widget build(BuildContext context) {

  Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController(); 


    List images = ["g.png", "t.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/signup.png"), fit: BoxFit.cover)),
              child: Column(
                children: [
                SizedBox(
                  height: h * .16,
                ),
                const CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 52,
                      backgroundImage: AssetImage("img/tPolice.png"),
                    ))
              ]),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                 
                  //Email
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller:emailController,
                        decoration: InputDecoration(
                            hintText: "Enter Email Id",
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
            
                  const SizedBox(
                    height: 30,
                  ),

                  //Password
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller:passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Set password",
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
                  
                  
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(30),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               blurRadius: 10,
                  //               spreadRadius: 7,
                  //               offset: const Offset(1, 1),
                  //               color: Colors.grey.withOpacity(0.2))
                  //         ]),
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //           hintText: "Enter Email id",
                  //           prefixIcon: const Icon(
                  //             Icons.email_outlined,
                  //             color: Colors.deepOrangeAccent,
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30),
                  //               borderSide: const BorderSide(
                  //                   color: Colors.white, width: 1.0)),
                  //           enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30),
                  //               borderSide: const BorderSide(
                  //                   color: Colors.white, width: 1.0)),
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30))),
                  //     )),

                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(30),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               blurRadius: 10,
                  //               spreadRadius: 7,
                  //               offset: const Offset(1, 1),
                  //               color: Colors.grey.withOpacity(0.2))
                  //         ]),
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //           hintText: "Enter Mobile number",
                  //           prefixIcon: const Icon(
                  //             Icons.phone_android_rounded,
                  //             color: Colors.deepOrangeAccent,
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30),
                  //               borderSide: const BorderSide(
                  //                   color: Colors.white, width: 1.0)),
                  //           enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30),
                  //               borderSide: const BorderSide(
                  //                   color: Colors.white, width: 1.0)),
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(30))),
                  //     )
                  //     ),

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(),
                  //     ),
                  //     Text(
                  //       "Forgot Password",
                  //       style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  //     ),
                  //   ],
                  // )
                
                ],
              ),
            ),
           
            const SizedBox(
              height: 25,
            ),
        
         // Sign Up
            // Container(
            //     width: w * 0.5,
            //     height: h * 0.08,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         image: const DecorationImage(
            //             image: AssetImage("img/loginbtn.png"),
            //             fit: BoxFit.cover)),
            //     child: const Center(
            //       child: Text(
            //         "Sign up",
            //         style: TextStyle(
            //             fontSize: 30,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     )),

            GestureDetector(
              onTap:(){
               AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                   //     authController.register(emailController.text.trim(), passwordController.text.trim());

              },
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("img/loginbtn.png"),
                          fit: BoxFit.cover)),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            ),
          






            const SizedBox(
              height: 30,
            ),
           
           RichText(
                text: TextSpan(
              text: "Sign up using one of the following method",
              style: TextStyle(color: Color.fromARGB(255, 223, 135, 20), fontSize: 17),
              // ignore: prefer_const_literals_to_create_immutables
            )),
       
            
            // Wrap(
            //   children: List<Widget>.generate(3, (index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: CircleAvatar(
            //         // radius: 28,
            //         // backgroundColor: Colors.deepOrangeAccent,
            //         child: CircleAvatar(
            //           radius: 20,
            //           backgroundImage: AssetImage(
            //               // ignore: prefer_interpolation_to_compose_strings
            //               "img/" + images[index]),
            //         ),
            //       ),
            //     );
            //   }),
            // )

              Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    // radius: 28,
                    // backgroundColor: Colors.grey.shade500,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          // ignore: prefer_interpolation_to_compose_strings
                          "img/" + images[index]),
                    ),
                  ),
                );
              }),
            )


          ],
        ),
      ),
    );
  }
}
