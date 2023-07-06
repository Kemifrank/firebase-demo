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
    apiKey: 'AIzaSyCaTkUAKCxmEmpfYYjpavxYS6G8z4rOPI0',
    appId: '1:440769853749:web:7c08ed01415588d1a0f47c',
    messagingSenderId: '440769853749',
    projectId: 'fir-demo-39ffd',
    authDomain: 'fir-demo-39ffd.firebaseapp.com',
    storageBucket: 'fir-demo-39ffd.appspot.com',
    measurementId: 'G-8J34M0947Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANvQAZt4LkwBcH5HMcLapXEpSbwMJKxJA',
    appId: '1:440769853749:android:ed956bd57fca3967a0f47c',
    messagingSenderId: '440769853749',
    projectId: 'fir-demo-39ffd',
    storageBucket: 'fir-demo-39ffd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUixeCX4QsHqb032RX52g6wTncnYIM8LA',
    appId: '1:440769853749:ios:f633c6150ddace38a0f47c',
    messagingSenderId: '440769853749',
    projectId: 'fir-demo-39ffd',
    storageBucket: 'fir-demo-39ffd.appspot.com',
    iosClientId: '440769853749-srb63gacddk47t80jb1dcfiegab7g6c6.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUixeCX4QsHqb032RX52g6wTncnYIM8LA',
    appId: '1:440769853749:ios:f633c6150ddace38a0f47c',
    messagingSenderId: '440769853749',
    projectId: 'fir-demo-39ffd',
    storageBucket: 'fir-demo-39ffd.appspot.com',
    iosClientId: '440769853749-srb63gacddk47t80jb1dcfiegab7g6c6.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDemo',
  );
}