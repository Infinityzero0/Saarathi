import 'package:flutter/material.dart';
import 'package:flutter_demo/auth_controller.dart';
import 'package:flutter_demo/choose.dart';
import 'package:flutter_demo/driver_signup.dart';
import 'package:flutter_demo/login_page.dart';
import 'package:flutter_demo/splash.dart';
// import 'package:flutter_demo/animated_splash.dart';
// import 'package:flutter_demo/signup_page.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:flutter_demo/login_page.dart';
// import 'package:flutter_demo/signup_page.dart';

// import 'driver_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // (value) => Get.put(AuthController) --  dependency injection
  await Firebase.initializeApp().then((value) => Get.put(AuthController));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:Splash(),
    );
  }
}
