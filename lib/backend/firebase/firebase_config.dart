import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDf8eJVvpvq4yrertAsJvcwKj5ShCI20Do",
            authDomain: "contraconnect.firebaseapp.com",
            projectId: "contraconnect",
            storageBucket: "contraconnect.firebasestorage.app",
            messagingSenderId: "4948694985",
            appId: "1:4948694985:web:2e225114b6457dc5f2fa18",
            measurementId: "G-TYN3JLMC1K"));
  } else {
    await Firebase.initializeApp();
  }
}
