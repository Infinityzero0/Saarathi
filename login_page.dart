import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/auth_controller.dart';
import 'package:flutter_demo/choose.dart';
// import 'package:flutter_demo/g_map.dart';
import 'package:flutter_demo/google_map.dart';
import 'package:flutter_demo/officier_signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';
// import 'signup_page.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  


  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// void tmpFunction(BuildContext context) {
//   Navigator.pushReplacement(context,
//       MaterialPageRoute(builder: (context) => GoogleMapScreen()));
// }

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); 


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
                      image: AssetImage("img/loginimg.png"), fit: BoxFit.cover)),
            ),
          
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sarathi",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                 
                 //Email login
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
                        controller: emailController,
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
                    height: 20,
                  ),
                  
                  //password
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
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
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
               
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            
            // Container(
            //     // width: w * 0.5,
            //     // height: h * 0.08,
            //     // decoration: BoxDecoration(
            //     //     borderRadius: BorderRadius.circular(30),
            //     //     image: const DecorationImage(
            //     //         image: AssetImage("img/loginbtn.png"),
            //     //         fit: BoxFit.cover)),
            //     // child: const Center(
            //     //   child: Text(
            //     //     "Sign in",
            //     //     style: TextStyle(
            //     //         fontSize: 30,
            //     //         fontWeight: FontWeight.bold,
            //     //         color: Colors.white),
            //     //   ),
            //     // ),
      
            // ),
      
            // To add on click on Image
            Center(
                child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(30),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => GoogleMapScreen()));
                        AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Ink.image(
                        image: const AssetImage("img/loginbtn.png"),
                        width: w * 0.5,
                        height: h * 0.08,
                        fit: BoxFit.cover,
                        child: const Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ))),
      


            SizedBox(
              height: w * .08,
            ),
            RichText(
                text: TextSpan(
              text: "Don't have an acccount?",
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
              // ignore: prefer_const_literals_to_create_immutables
              //     children: [
              //   TextSpan(
              //       text: " Create",
              //       style: const TextStyle(
              //           color: Colors.black,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold),
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () => Get.to(() => const SignUp()))
              // ]
            )),
            const SizedBox(
              height: 5,
            ),
          
            // Container(
            //   child: InkWell(
            //           onTap: () {
            //             Navigator.pushReplacement(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const GoogleMapScreen()));
            //           },
            //           borderRadius: BorderRadius.circular(30),
            //           child: Ink.image(
            //             image: const AssetImage("img/loginbtn.png"),
            //             width: w * 0.5,
            //             height: h * 0.08,
            //             fit: BoxFit.cover,
            //             child: const Center(
            //               child: Text(
            //                 "Sign in",
            //                 style: TextStyle(
            //                     fontSize: 30,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white),
            //               ),
            //             ),
            //           ),
            //         )),
          





           
            ElevatedButton(
              child: const Text('create'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseUser()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
