
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:version1/splash.dart';

import 'home.dart';
import 'login.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  runApp(MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (BuildContext context){
          return LoginPage();
        },
        '/home':(context){
          return HomePage();
        }},
      debugShowCheckedModeBanner: false,
      home: Splash_Animated(),
    );
  }
}
