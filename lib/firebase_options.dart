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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDGVo0MdDGW6vAczjmdZUoC5aU1ZZP8sEA',
    appId: '1:72391011120:web:ccb428a6e32abbc84136f5',
    messagingSenderId: '72391011120',
    projectId: 'solat-sum',
    authDomain: 'solat-sum.firebaseapp.com',
    storageBucket: 'solat-sum.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBvzFGSIK-1ez0JT-M5L7Uo68GepJ65TY',
    appId: '1:72391011120:android:4ef55588f5873b2c4136f5',
    messagingSenderId: '72391011120',
    projectId: 'solat-sum',
    storageBucket: 'solat-sum.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDV0QTOb50igp1ZjXvyATKnxjmML4RL_rQ',
    appId: '1:72391011120:ios:22d16dfcfef9340d4136f5',
    messagingSenderId: '72391011120',
    projectId: 'solat-sum',
    storageBucket: 'solat-sum.appspot.com',
    iosBundleId: 'com.example.solatSum',
  );
}
