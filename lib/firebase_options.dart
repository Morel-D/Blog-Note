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
    apiKey: 'AIzaSyBlX77kh--yio2Bxy8D4C5QX0W8kQvaBvA',
    appId: '1:1007700155829:web:db93ea0a5405f443078dfc',
    messagingSenderId: '1007700155829',
    projectId: 'blognotes-d2a88',
    authDomain: 'blognotes-d2a88.firebaseapp.com',
    storageBucket: 'blognotes-d2a88.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqbGtynWKPibJqMYIrUR9YpWh6NZBM_xs',
    appId: '1:1007700155829:android:08b463d5fb7b9570078dfc',
    messagingSenderId: '1007700155829',
    projectId: 'blognotes-d2a88',
    storageBucket: 'blognotes-d2a88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqfc5AHQ0oI_ceTgLAKEpf2HJwIlbXVjc',
    appId: '1:1007700155829:ios:6d7038eb9bc13d66078dfc',
    messagingSenderId: '1007700155829',
    projectId: 'blognotes-d2a88',
    storageBucket: 'blognotes-d2a88.appspot.com',
    iosClientId: '1007700155829-9gbs05rede79pptmt3mkjm5k4acdc83g.apps.googleusercontent.com',
    iosBundleId: 'com.example.blogNotes',
  );
}