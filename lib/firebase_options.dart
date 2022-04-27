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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBP68hpE3EFHiv17EkKQatpEL3bUk9Zvw4',
    appId: '1:356844505654:web:adfd5e908abdd5e522a697',
    messagingSenderId: '356844505654',
    projectId: 'flutter-test-30648',
    authDomain: 'flutter-test-30648.firebaseapp.com',
    storageBucket: 'flutter-test-30648.appspot.com',
    measurementId: 'G-PQ3YFLGS28',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeacwkdMOBtI5P3Vl23sYQT8lKc97meW8',
    appId: '1:356844505654:android:ec7906ea548b095c22a697',
    messagingSenderId: '356844505654',
    projectId: 'flutter-test-30648',
    storageBucket: 'flutter-test-30648.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBKLdap0cB7-XLiwroSpckCyrBo1OUp0M',
    appId: '1:356844505654:ios:677b6c08071e761d22a697',
    messagingSenderId: '356844505654',
    projectId: 'flutter-test-30648',
    storageBucket: 'flutter-test-30648.appspot.com',
    iosClientId: '356844505654-soacrepmhel566fgenkcc5jk4tj4lq0q.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
