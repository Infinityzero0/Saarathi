import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/google_map.dart';
import 'package:get/get.dart';
import '../login_page.dart';

class AuthController extends GetxController{
 
 //Access auth controller properties from anywhere
 //AuthController.instance..
   static AuthController instance = Get.find();
  
  //firebase variable model instilalisation
   
   // will include email, password, name,..
   late Rx<User?> _user;

    // using this instance we are able to access firebase auth properties
    FirebaseAuth auth = FirebaseAuth.instance;


   @override
   void onReady(){
    super.onReady();
    
      // Register AuthController instance with GetX dependency injection system
    //Get.put<AuthController>(AuthController());


    // gives  firebase model to current user 
    //user
    _user= Rx<User?>(auth.currentUser);
    
    //to keep track of user activites login , log out , _user will be notified
    _user.bindStream(auth.userChanges());
    
     // _user = listener , _initialScreen act as callback function  , listening any changes all the time
     ever(_user, _initialScreen);
   }
   
   _initialScreen(User? user){
    
    //send user not to logged in send him to welcome page else send him to map page
   
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>GoogleMapScreen(email:(user.email).toString()));
    }

   }

   void register(String email,String password, String userType)async{
 
     try{
       await auth.createUserWithEmailAndPassword(email: email, password: password, userType:userType);
      // auth.signInWithCredential(credential)
     }
     catch(e){
       Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
          style: TextStyle(color: Colors.black,
            ),
          ), 
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.black,
            ),
          )

       ) ;    } 
       
       }
    
       
   void login(String email,String password)async{
 
     try{
       await auth.signInWithEmailAndPassword(email: email, password: password);
      // auth.signInWithCredential(credential)
     }
     catch(e){
       Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
          style: TextStyle(color: Colors.black,
            ),
          ), 
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.black,
            ),
          )

       ) ;    } 
       
       }


       void logOut()async{
        await auth.signOut();
       }



       }