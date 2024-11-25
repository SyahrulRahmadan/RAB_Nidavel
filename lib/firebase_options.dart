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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCWtFp2MOcyd1X7R4lQxtjJ8nbNW7GBkD0',
    appId: '1:763812175861:web:10b3a61019d6fa9a9fcabc',
    messagingSenderId: '763812175861',
    projectId: 'nidavel-project',
    authDomain: 'nidavel-project.firebaseapp.com',
    storageBucket: 'nidavel-project.appspot.com',
    measurementId: 'G-5FJXK7BLD9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYtWJw87TnEGaTIRoCBUfNTHB__9m-qWU',
    appId: '1:763812175861:android:3bbff7b73ee689bc9fcabc',
    messagingSenderId: '763812175861',
    projectId: 'nidavel-project',
    storageBucket: 'nidavel-project.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWtFp2MOcyd1X7R4lQxtjJ8nbNW7GBkD0',
    appId: '1:763812175861:web:2f14d611b302bee19fcabc',
    messagingSenderId: '763812175861',
    projectId: 'nidavel-project',
    authDomain: 'nidavel-project.firebaseapp.com',
    storageBucket: 'nidavel-project.appspot.com',
    measurementId: 'G-PR1DMQJ3TT',
  );
}
