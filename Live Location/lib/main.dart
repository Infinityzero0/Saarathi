import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_google_map/notification_widget.dart';
//import 'notification_widget.dart';

//notification variable
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  @override
  void initState() {
    super.initState();
    //Noti.initialize(flutterLocalNotificationsPlugin);
    NotificationWidget.init();
  }

  String location = 'Null, Press Button';
  String Address = 'search';

//from pub.dev
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

//end

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //print(placemark);
    Placemark place = placemark[0];

    Address =
        '${place.street}, ${place.thoroughfare} ${place.subLocality}, ${place.postalCode}, ${place.country}';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Coordinates Points',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            location,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'ADDRESS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${Address}',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
              onPressed: () async {
                Position position = await _determinePosition();
                print(position.latitude);
                print(position.longitude);

                location =
                    'Lat: ${position.latitude}, Long: ${position.longitude}';

                GetAddressFromLatLong(position);

                print('button clicked');
                NotificationWidget.showNotifictaion(
                    title: "Notification", body: '${location}');

                setState(() {});
              },

              /*onPressed: () {
                print('button clicked');
                NotificationWidget.showNotifictaion(
                    title: "Notification", body: 'Messsage body');
              },*/
              child: Text('Get Location'))
        ]),
      ),
    );
  }
}
