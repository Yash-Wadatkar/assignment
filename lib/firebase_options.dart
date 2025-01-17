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
    apiKey: 'AIzaSyAABH0LwqDwT7IEGfqm9PjFn5tRKZt6b2U',
    appId: '1:15788486736:web:aa911af6d2583cf8b7a155',
    messagingSenderId: '15788486736',
    projectId: 'assignment-de290',
    authDomain: 'assignment-de290.firebaseapp.com',
    storageBucket: 'assignment-de290.appspot.com',
    measurementId: 'G-ZKTRNFVNME',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBhxcHIVSyQU2ctXegko1wH8DUv8kMs6Y',
    appId: '1:15788486736:android:5e90501a7e73fa1ab7a155',
    messagingSenderId: '15788486736',
    projectId: 'assignment-de290',
    storageBucket: 'assignment-de290.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc0MYi1e5f2Hd79jD3SbifWL6TUj9ca4s',
    appId: '1:15788486736:ios:55a156e0b5d7acc9b7a155',
    messagingSenderId: '15788486736',
    projectId: 'assignment-de290',
    storageBucket: 'assignment-de290.appspot.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc0MYi1e5f2Hd79jD3SbifWL6TUj9ca4s',
    appId: '1:15788486736:ios:55a156e0b5d7acc9b7a155',
    messagingSenderId: '15788486736',
    projectId: 'assignment-de290',
    storageBucket: 'assignment-de290.appspot.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAABH0LwqDwT7IEGfqm9PjFn5tRKZt6b2U',
    appId: '1:15788486736:web:4b548765e3d5de59b7a155',
    messagingSenderId: '15788486736',
    projectId: 'assignment-de290',
    authDomain: 'assignment-de290.firebaseapp.com',
    storageBucket: 'assignment-de290.appspot.com',
    measurementId: 'G-F6J2LPSGGQ',
  );
}
