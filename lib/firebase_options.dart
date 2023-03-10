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
    apiKey: 'AIzaSyDeGVnnq5Eapep-Dt9jDOvMeAbcDJI3t3g',
    appId: '1:24407155112:web:9ecd04522fd653d405fd9d',
    messagingSenderId: '24407155112',
    projectId: 'chat-app-9f9bb',
    authDomain: 'chat-app-9f9bb.firebaseapp.com',
    storageBucket: 'chat-app-9f9bb.appspot.com',
    measurementId: 'G-FQ5D0K556X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOq9D3bAhqfshSt5ET9q0FAiYaaNmAPn4',
    appId: '1:24407155112:android:e91c3cfc6eaf7c0b05fd9d',
    messagingSenderId: '24407155112',
    projectId: 'chat-app-9f9bb',
    storageBucket: 'chat-app-9f9bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHzDIuUeTw4OlTlpzPsfSTqpd1skg8KdA',
    appId: '1:24407155112:ios:106d4d922c97730e05fd9d',
    messagingSenderId: '24407155112',
    projectId: 'chat-app-9f9bb',
    storageBucket: 'chat-app-9f9bb.appspot.com',
    iosClientId: '24407155112-etu2biol9uuhg4pfthalmhr144jcptgc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHzDIuUeTw4OlTlpzPsfSTqpd1skg8KdA',
    appId: '1:24407155112:ios:106d4d922c97730e05fd9d',
    messagingSenderId: '24407155112',
    projectId: 'chat-app-9f9bb',
    storageBucket: 'chat-app-9f9bb.appspot.com',
    iosClientId: '24407155112-etu2biol9uuhg4pfthalmhr144jcptgc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
