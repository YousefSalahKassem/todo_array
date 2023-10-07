// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBNdv4BNWtHAZ06Z7YVRN7RlraUYkn3Gms',
    appId: '1:83923483975:web:582bd9bc166591b2d2a062',
    messagingSenderId: '83923483975',
    projectId: 'todoapp-e00bd',
    authDomain: 'todoapp-e00bd.firebaseapp.com',
    storageBucket: 'todoapp-e00bd.appspot.com',
    measurementId: 'G-G9TV9RDGXP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAa-Ok3NP84l30I5HIJEeSSL04eIuGL4aY',
    appId: '1:83923483975:android:f148583a058eb730d2a062',
    messagingSenderId: '83923483975',
    projectId: 'todoapp-e00bd',
    storageBucket: 'todoapp-e00bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtlp1vba2rGPxRvZGfFrTtnf_pPPIM9yU',
    appId: '1:83923483975:ios:ff12cd2e8cf2f553d2a062',
    messagingSenderId: '83923483975',
    projectId: 'todoapp-e00bd',
    storageBucket: 'todoapp-e00bd.appspot.com',
    iosClientId: '83923483975-stm84ghf4p7h5qki0kth49oiip0jd1pv.apps.googleusercontent.com',
    iosBundleId: 'com.todoapp.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtlp1vba2rGPxRvZGfFrTtnf_pPPIM9yU',
    appId: '1:83923483975:ios:9f3fe7d5728e3b01d2a062',
    messagingSenderId: '83923483975',
    projectId: 'todoapp-e00bd',
    storageBucket: 'todoapp-e00bd.appspot.com',
    iosClientId: '83923483975-kn7r6ir3melpvrtr5odoiu9fqqjl7ih9.apps.googleusercontent.com',
    iosBundleId: 'com.todoapp.todoapp.RunnerTests',
  );
}