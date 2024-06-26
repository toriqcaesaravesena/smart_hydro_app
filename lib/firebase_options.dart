// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCNnLg6NObBYSxunOg5r5QXzPWKxY3dLuc',
    appId: '1:630420653663:web:550ee1bf8adcfbbea93dea',
    messagingSenderId: '630420653663',
    projectId: 'smart-hydro-app-2f0c8',
    authDomain: 'smart-hydro-app-2f0c8.firebaseapp.com',
    storageBucket: 'smart-hydro-app-2f0c8.appspot.com',
    measurementId: 'G-MTKZ65MSKC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfKGRZmmC3ecTQ0INMhsTw0Ds_c1e_9UQ',
    appId: '1:630420653663:android:299bd339f8888511a93dea',
    messagingSenderId: '630420653663',
    projectId: 'smart-hydro-app-2f0c8',
    storageBucket: 'smart-hydro-app-2f0c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgMImZ238vf1vOoM9mXKkZHsrHHJvd67g',
    appId: '1:630420653663:ios:10eb0ca900b5073fa93dea',
    messagingSenderId: '630420653663',
    projectId: 'smart-hydro-app-2f0c8',
    storageBucket: 'smart-hydro-app-2f0c8.appspot.com',
    iosBundleId: 'com.example.smartHydroApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgMImZ238vf1vOoM9mXKkZHsrHHJvd67g',
    appId: '1:630420653663:ios:10eb0ca900b5073fa93dea',
    messagingSenderId: '630420653663',
    projectId: 'smart-hydro-app-2f0c8',
    storageBucket: 'smart-hydro-app-2f0c8.appspot.com',
    iosBundleId: 'com.example.smartHydroApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCNnLg6NObBYSxunOg5r5QXzPWKxY3dLuc',
    appId: '1:630420653663:web:f057b5cb5ede5600a93dea',
    messagingSenderId: '630420653663',
    projectId: 'smart-hydro-app-2f0c8',
    authDomain: 'smart-hydro-app-2f0c8.firebaseapp.com',
    storageBucket: 'smart-hydro-app-2f0c8.appspot.com',
    measurementId: 'G-SFNZENV200',
  );
}
