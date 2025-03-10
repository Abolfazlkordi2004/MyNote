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
    apiKey: 'AIzaSyBopa-vBz7g04YP-N8xadrqCtD8VA1t-Nw',
    appId: '1:515267391770:web:c24996fb85631410ab3ca3',
    messagingSenderId: '515267391770',
    projectId: 'my-notes-id',
    authDomain: 'my-notes-id.firebaseapp.com',
    storageBucket: 'my-notes-id.appspot.com',
    measurementId: 'G-K2J0T36NTT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp3_Gu1EQ8sy-PXMEojQHSZMHFAtDvf54',
    appId: '1:515267391770:android:41ea773312fbe343ab3ca3',
    messagingSenderId: '515267391770',
    projectId: 'my-notes-id',
    storageBucket: 'my-notes-id.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC53-BcfKiT5Txh2K4wGgvLvW6RtyqcOJI',
    appId: '1:515267391770:ios:733e8b0f603f58a2ab3ca3',
    messagingSenderId: '515267391770',
    projectId: 'my-notes-id',
    storageBucket: 'my-notes-id.appspot.com',
    iosBundleId: 'com.example.abolfazlnotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC53-BcfKiT5Txh2K4wGgvLvW6RtyqcOJI',
    appId: '1:515267391770:ios:733e8b0f603f58a2ab3ca3',
    messagingSenderId: '515267391770',
    projectId: 'my-notes-id',
    storageBucket: 'my-notes-id.appspot.com',
    iosBundleId: 'com.example.abolfazlnotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBopa-vBz7g04YP-N8xadrqCtD8VA1t-Nw',
    appId: '1:515267391770:web:270e417997f6e1bbab3ca3',
    messagingSenderId: '515267391770',
    projectId: 'my-notes-id',
    authDomain: 'my-notes-id.firebaseapp.com',
    storageBucket: 'my-notes-id.appspot.com',
    measurementId: 'G-M6PLCQNHFD',
  );
}
