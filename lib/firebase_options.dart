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
    apiKey: 'AIzaSyCHNvDOxP_M-PHfEaw5KCWyGJ9oUNFj3JE',
    appId: '1:489827988770:android:2c5d32e8832d717365617b',
    messagingSenderId: '489827988770',
    projectId: 'chat-app-c39c3',
    storageBucket: 'chat-app-c39c3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD00PfC7QdhH3_baRMRVHVAsssDD5vu-qE',
    appId: '1:489827988770:ios:e4dcdae03360865965617b',
    messagingSenderId: '489827988770',
    projectId: 'chat-app-c39c3',
    storageBucket: 'chat-app-c39c3.firebasestorage.app',
    androidClientId: '489827988770-10j95llpqug6fsejnf0qc32b8gd0icp5.apps.googleusercontent.com',
    iosClientId: '489827988770-uor4edqkpj47nnl28oi2j65e6vboncuq.apps.googleusercontent.com',
    iosBundleId: 'com.sagar.pushChat',
  );

}