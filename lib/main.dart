import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_store_web/views/screens/main_scr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBtD6Mmytx3FdDqrOjBkL3Ag_rRGTjx0P4",
          authDomain: "teststore-bb8d1.firebaseapp.com",
          projectId: "teststore-bb8d1",
          storageBucket: "teststore-bb8d1.appspot.com",
          messagingSenderId: "229197922539",
          appId: "1:229197922539:web:f1445d6f758be370fafeae"));

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}
