import 'MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/*
AMap
polyline
active logins inn path
*/
/*
token = cpITE9TCQT2dKY4xsAH0LB:APA91bEErK26ulfhNmmbK9a7dzX0VhG7blAdeu7eG0FmnSER2JI9gsCqKyDo6iO7TRO2pTZWxgXrgIkAWrM4uxPv_Fnf41z25OvHGDqGUK5Y06vil8jq6NyMmto5yOD6w3_OGGPSPEk1

santosh: dECBEGxORmujKswCjdhWfz:APA91bGrDhZHU1sznx_0zdWfcekTge_S457ZYdTPSddpCbnYzR_JattaeHRL7TlcGqniBnE10WXl4Y33qnRTRoDuULweKEgCW7pzOiPvjL4yDubRcUahwJsJwhAiGiF894lc2q6wPW-S
*/

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
