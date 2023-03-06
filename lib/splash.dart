import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:version1/login.dart';

class Splash_Animated extends StatelessWidget {
  const Splash_Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.rotationTransition,
        splash: const CircleAvatar(
          radius: 90,
          backgroundImage: AssetImage("assets/images/food.jpg"),
        ),
        nextScreen:  LoginPage(),


        duration: 1000,

        animationDuration: const Duration(seconds: 2));

  }
}