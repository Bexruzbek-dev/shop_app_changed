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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_4CgFTGccc8rJbL-Y80iXPAcKfpZ4vRU',
    appId: '1:799747681967:android:d668d7c9a277e9b6bf6e5a',
    messagingSenderId: '799747681967',
    projectId: 'fir-auth-dfa18',
    storageBucket: 'fir-auth-dfa18.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlvHImpqpSufWh9l0yVb8kgmMM9JTn1jE',
    appId: '1:799747681967:ios:ae2873ddb498a9d0bf6e5a',
    messagingSenderId: '799747681967',
    projectId: 'fir-auth-dfa18',
    storageBucket: 'fir-auth-dfa18.appspot.com',
    androidClientId: '799747681967-9egbl17u82bh9plfp4kpi3ludatfriat.apps.googleusercontent.com',
    iosClientId: '799747681967-55mil40fgpeqt66kgrkmlbffs9hl5ut7.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp',
  );

}