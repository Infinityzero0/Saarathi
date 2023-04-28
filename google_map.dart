import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:flutter_demo/auth_controller.dart';

class GoogleMapScreen extends StatefulWidget {
 final String email;
  GoogleMapScreen({super.key, required this.email});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  
  
  Set<Marker> _marker = {};
  LocationData? _currentLocation;
   
  void _onMapCreated(GoogleMapController controller) {
    //Calling to change map style
    // controller.setMapStyle(Utils.mapStyle);

    setState(() {
      _marker.add(
        const Marker(
            markerId: MarkerId('Id-1'),
            position: LatLng(17.659150, 75.906240),
            infoWindow: InfoWindow(
              title: 'Akash Palace',
              snippet: 'Sky',
            )),
      );
    });
  }

  @override
   
  Widget build(BuildContext context) {
     
    List images = ["g.png", "t.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
       
        appBar: AppBar(
          title: const Text('Client'),
        ),
        
        drawer: Drawer(
          child: ListView(
            children: [
                //  UserAccountsDrawerHeader
                //  (
                //   accountName: Text("Ram"),
                //   accountEmail: Text("Driver"),
                //   currentAccountPicture: CircleAvatar(foregroundImage: NetworkImage("https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                //   ),
                //  ),
                
                DrawerHeader(
                  decoration:BoxDecoration(
                    color:Color.fromARGB(185, 251, 187, 138),
                   // border:Border.all(width: 3.0, color: Color.fromARGB(255, 1, 0, 2)),
                    //borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child:ListView(
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Text(
                              "Welcome",
                             style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                          
                             ),
                            ),
                            
                   
               const SizedBox(
              height: 10,
            ),
  
                           Text(
                             widget.email,
                             style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                          
                             ),
                            ),
                       ],
                     ),
                    
            
                   
               const SizedBox(
              height: 10,
            ),


            GestureDetector(
               onTap:(){
              //   AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                  AuthController.instance.logOut();
              },
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("img/loginbtn.png"),
                          )),
                  child: const Center(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            ),
                                ],
                  ), 
                 
                )
            ],
          ),
        ),




        body: GoogleMap(
            onMapCreated: (controller) {
              _onMapCreated(controller);
            },
            markers: _marker,
            initialCameraPosition: CameraPosition(
              target: LatLng(17.659150, 75.906240),
              zoom: 15,
            )));
  }
}

// For changing the map style
// visit Create map style
// copy Json and use here
class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#523735"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#c9b2a6"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#dcd2be"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ae9e90"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#93817c"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#a5b076"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#447530"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#fdfcf8"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f8c967"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e9bc62"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e98d58"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#db8555"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#806b63"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8f7d77"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#b9d3c2"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#92998d"
      }
    ]
  }
]

''';
}
