import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/mainScreens/search_places_screen.dart';
import 'package:users_app/widgets/my_drawer.dart';
import 'package:users_app/widgets/progress_dialog.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  
 
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
    
    GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
    double searchLocationContainerHeight = 220;
    
    Position? userCurrentPosition;
    var geoLocator = Geolocator();
    
    LocationPermission? _locationPermission;
    double bottomPaddingOfMap = 0;
    
   List<LatLng> pLineCoOrdinatesList = [];
  Set<Polyline> polyLineSet = {};
  

  //set of marker and circle for 
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};



  // String userName="Your Name";
  // String userEmail="Your Email"; 


  bool openNavigationDrawer = true;

    //to get user permission
  checkIfLocationPermissionAllowed() async
  {
     //ask location permission
    _locationPermission = await Geolocator.requestPermission();

    if(_locationPermission == LocationPermission.denied)
    {
       //if denied ask again
      _locationPermission = await Geolocator.requestPermission();
       
    if(_locationPermission == LocationPermission.denied)
    {
       //if denied ask again
      _locationPermission = await Geolocator.requestPermission();
      
    }
    }
  }
  
  locateUserPosition() async
  {
    //gives position of current user
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   
    userCurrentPosition = cPosition;
    
    //finding latlng and setting  camera as per latlng
    LatLng latLngPosition = LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
   
    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

     
    String humanReadableAddress = await AssistantMethods.searchAddressForGeographicCoOrdinates(userCurrentPosition!,context);
    print("this is your address = " + humanReadableAddress);

    // userName = userModelCurrentInfo!.name!;
    // userEmail = userModelCurrentInfo!.email!;
  

  }

    
    

  // blackThemeGoogleMap() {
  //   //For black theme
  //   newGoogleMapController..setMapStyle('''
  //                   [
  //                     {
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#242f3e"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#746855"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "elementType": "labels.text.stroke",
  //                       "stylers": [
  //                         {
  //                           "color": "#242f3e"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "administrative.locality",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#d59563"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "poi",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#d59563"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "poi.park",
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#263c3f"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "poi.park",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#6b9a76"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road",
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#38414e"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road",
  //                       "elementType": "geometry.stroke",
  //                       "stylers": [
  //                         {
  //                           "color": "#212a37"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#9ca5b3"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road.highway",
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#746855"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road.highway",
  //                       "elementType": "geometry.stroke",
  //                       "stylers": [
  //                         {
  //                           "color": "#1f2835"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "road.highway",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#f3d19c"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "transit",
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#2f3948"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "transit.station",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#d59563"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "water",
  //                       "elementType": "geometry",
  //                       "stylers": [
  //                         {
  //                           "color": "#17263c"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "water",
  //                       "elementType": "labels.text.fill",
  //                       "stylers": [
  //                         {
  //                           "color": "#515c6d"
  //                         }
  //                       ]
  //                     },
  //                     {
  //                       "featureType": "water",
  //                       "elementType": "labels.text.stroke",
  //                       "stylers": [
  //                         {
  //                           "color": "#17263c"
  //                         }
  //                       ]
  //                     }
  //                   ]
  //               ''');
  //                          }
 
  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: sKey,
        drawer: Container(
        width: 265,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(255, 255, 255, 255),
          ),
          child: MyDrawer(
            name: userModelCurrentInfo!.name!,
            email: userModelCurrentInfo!.email!,
          ),
        ),
      ),
        
       body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            polylines: polyLineSet,
            markers: markersSet,
            circles: circlesSet,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

                      setState(() {
                bottomPaddingOfMap = 240;
              });

                 locateUserPosition();   

            },
                  ),
         
           //Custom hamburger button  
           Positioned(
            top: 30,
            left: 14,
            child: GestureDetector(
              onTap: ()
              {
                if(openNavigationDrawer){
                sKey.currentState!.openDrawer();
                }
                else{
                  //restart refresh minimize app programatically
                  SystemNavigator.pop();
                }
              },
              child:  CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: Icon(
                  openNavigationDrawer ?  Icons.menu:Icons.close,
                  color: Color.fromARGB(232, 20, 20, 20),
                ),
              ),
            ),
          ),
           

            //ui for searching location
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 120),
              child: Container(
              height: searchLocationContainerHeight,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    children: [
                      //from
                      Row(
                        children: [
                          const Icon(Icons.add_location_alt_outlined, color: Colors.grey,),
                          const SizedBox(width: 12.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //add gesture later
                              const Text(
                                "Source",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                      Provider.of<AppInfo>(context).userPickUpLocation != null
                                    ? (Provider.of<AppInfo>(context).userPickUpLocation!.locationName!).substring(0,24) + "..."
                                    : "not getting address",
                                style: const TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      //to
                      GestureDetector(
                        onTap: ()
                        async{
                           //go to search places screen
                          var responseFromSearchScreen = await Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchPlacesScreen()));
                        
                          if(responseFromSearchScreen == "obtainedDropoff")
                          {
                            //draw routes - draw polyline
                            await drawPolyLineFromOriginToDestination();
       
                            setState(() {
                              openNavigationDrawer=false;
                            });

                          }

                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add_location_alt_outlined, color: Colors.grey,),
                            const SizedBox(width: 12.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Destination",
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                Text(

                                 Provider.of<AppInfo>(context).userDropOffLocation != null 
                                      ? Provider.of<AppInfo>(context).userDropOffLocation!.locationName!
                                      :  "Where to go?",
                                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      ElevatedButton(
                        child: const Text(
                          "Book Ambulance",
                        ),
                        onPressed: ()
                        {
                           
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
            
        ],
      ),
    );
  }

   //toDrawPolyline

   Future<void> drawPolyLineFromOriginToDestination() async
  {
    //getting source and destination
    var originPosition = Provider.of<AppInfo>(context, listen: false).userPickUpLocation;
    var destinationPosition = Provider.of<AppInfo>(context, listen: false).userDropOffLocation;
    
    //getting sorce , destination latlng 
    var originLatLng = LatLng(originPosition!.locationLatitude!, originPosition.locationLongitude!);
    var destinationLatLng = LatLng(destinationPosition!.locationLatitude!, destinationPosition.locationLongitude!);

    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(message: "Please wait...",),
    );
    
    //assigning it to variable
    var directionDetailsInfo = await AssistantMethods.obtainOriginToDestinationDirectionDetails(originLatLng, destinationLatLng);

    Navigator.pop(context);

    print("These are points = ");
    print(directionDetailsInfo!.e_points);

    PolylinePoints pPoints = PolylinePoints();
    //decoding set of encodied points
    List<PointLatLng> decodedPolyLinePointsResultList = pPoints.decodePolyline(directionDetailsInfo.e_points!);

    pLineCoOrdinatesList.clear();

    if(decodedPolyLinePointsResultList.isNotEmpty)
    {
      decodedPolyLinePointsResultList.forEach((PointLatLng pointLatLng)
      {
        pLineCoOrdinatesList.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

   polyLineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Color.fromARGB(255, 84, 187, 255),
        polylineId: const PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoOrdinatesList,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polyLineSet.add(polyline);
    });
    //to adjust map according to co-ordinate
    LatLngBounds boundsLatLng;
    if(originLatLng.latitude > destinationLatLng.latitude && originLatLng.longitude > destinationLatLng.longitude)
    {
      boundsLatLng = LatLngBounds(southwest: destinationLatLng, northeast: originLatLng);
    }
    else if(originLatLng.longitude > destinationLatLng.longitude)
    {
      boundsLatLng = LatLngBounds(
          southwest: LatLng(originLatLng.latitude, destinationLatLng.longitude),
          northeast: LatLng(destinationLatLng.latitude, originLatLng.longitude),
      );
    }
    else if(originLatLng.latitude > destinationLatLng.latitude)
    {
      boundsLatLng = LatLngBounds(
        southwest: LatLng(destinationLatLng.latitude, originLatLng.longitude),
        northeast: LatLng(originLatLng.latitude, destinationLatLng.longitude),
      );
    }
    else
    {
      boundsLatLng = LatLngBounds(southwest: originLatLng, northeast: destinationLatLng);
    }
    
    newGoogleMapController.animateCamera(CameraUpdate.newLatLngBounds(boundsLatLng, 65));

    Marker originMarker = Marker(
      markerId: const MarkerId("originID"),
      infoWindow: InfoWindow(title: originPosition.locationName, snippet: "Origin"),
      position: originLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );

    Marker destinationMarker = Marker(
      markerId: const MarkerId("destinationID"),
      infoWindow: InfoWindow(title: destinationPosition.locationName, snippet: "Destination"),
      position: destinationLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    setState(() {
      markersSet.add(originMarker);
      markersSet.add(destinationMarker);
    });

    Circle originCircle = Circle(
      circleId: const CircleId("originID"),
      fillColor: Colors.green,
      radius: 12,
      strokeWidth: 3,
      strokeColor: Colors.white,
      center: originLatLng,
    );

    Circle destinationCircle = Circle(
      circleId: const CircleId("destinationID"),
      fillColor: Colors.red,
      radius: 12,
      strokeWidth: 3,
      strokeColor: Colors.white,
      center: destinationLatLng,
    );

    setState(() {
      circlesSet.add(originCircle);
      circlesSet.add(destinationCircle);
    });
  }



}
