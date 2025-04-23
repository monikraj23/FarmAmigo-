import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:impciker/LoginMobile.dart';
import 'package:impciker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Picker",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginMobile(), // Updated to point to LoginMobile
    );
  }
}
// import 'package:flutter/material.dart';
//dlfjnedf
