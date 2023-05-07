//Ambulance detalis here

import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';


class CarInfoScreen extends StatefulWidget
{

  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}



class _CarInfoScreenState extends State<CarInfoScreen>
{
  TextEditingController ambulanceModelTextEditingController = TextEditingController();
  TextEditingController ambulancNumberTextEditingController = TextEditingController();
  TextEditingController ambulancColorTextEditingController = TextEditingController();
  TextEditingController hospitalTextEditingController = TextEditingController();
  

  //List<String> carTypesList = ["uber-x", "uber-go", "bike"];
List<String> carTypesList = ["Normal", "Medium", "Advance"];
String? selectedCarType;


  saveCarInfo()
  {
    Map driverCarInfoMap =
    {
      "ambulance_color": ambulanceModelTextEditingController.text.trim(),
      "ambulance_number": ambulancNumberTextEditingController.text.trim(),
      "ambulance_model": ambulancColorTextEditingController.text.trim(),
      "hospital_name": hospitalTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("ambulance_details").set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Car Details has been saved, Congratulations.");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/logo1.png"),
              ),

          
              const Text(
                "Write Ambulance Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromARGB(255, 9, 9, 9),
                  fontWeight: FontWeight.bold,
                ),
              ),
  

              //carModel = > Ambulance Model
              TextField(
                controller: ambulanceModelTextEditingController,
                style: const TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                ),
                decoration: const InputDecoration(
                  labelText: "Ambulance Model",
                  hintText: "Ambulance Model",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 9, 9, 9)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 9, 9, 9)),
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 14,
                  ),
                ),
              ),
              

              const SizedBox(height: 15,),


              //carNumber => Ambulance RC Number
              TextField(
                controller: ambulancNumberTextEditingController,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: "Ambulance Number",
                  hintText: "Ambulance Number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 9, 9, 9)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 9, 9, 9)),
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 14,
                  ),
                ),
              ),
              

                const SizedBox(height: 15,),


              //Hospital/Service Name
              TextField(
                controller: hospitalTextEditingController,
                style: const TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                ),
                decoration: const InputDecoration(
                  labelText: "Hospital/Service Name",
                  hintText: "Hospital/Service Name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 15,),


              //carColor = > Ambulance Color
              TextField(
                controller: ambulancColorTextEditingController,
                style: const TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                ),
                decoration: const InputDecoration(
                  labelText: "Ambulance Color",
                  hintText: "Ambulance Color",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 15,),

              DropdownButton(
                iconSize: 26,
                dropdownColor: Color.fromARGB(255, 248, 245, 245),
                hint: const Text(
                  "Please choose Ambulance Type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 37, 37, 37),
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue)
                {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carTypesList.map((car){
                  return DropdownMenuItem(
                    child: Text(
                      car,
                      style: const TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
                    ),
                    value: car,
                  );
                }).toList(),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: ()
                {
                  if(ambulancColorTextEditingController.text.isNotEmpty
                      && ambulancNumberTextEditingController.text.isNotEmpty
                      && ambulanceModelTextEditingController.text.isNotEmpty 
                      && hospitalTextEditingController.text.isNotEmpty   
                      && selectedCarType != null)
                  {
                    saveCarInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 41, 41, 41),
                ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 253, 253),
                    fontSize: 18,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
