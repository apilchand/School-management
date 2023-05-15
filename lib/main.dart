import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathshala',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), 
    );
  }
}
