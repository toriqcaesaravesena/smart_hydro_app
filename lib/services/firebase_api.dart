// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotification() async {
//     await _firebaseMessaging.requestPermission();

//     final FCMToken = await _firebaseMessaging.getToken();

//     print("Token: $FCMToken");
//   }

//   void handleMessage(RemoteMessage? message) {
//     if (message == null ) return;

//     navigatorKey.currenState?.pushNamed(
//       arguments: message,
//     );
//   }
// }