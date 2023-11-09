import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/cover_page.dart';
import 'package:quiz_app/Screens/home_screen.dart';
import 'package:quiz_app/Screens/splash_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'splash':(context)=>const SplashScreen(),
      'cover':(context)=>const CoverPage(),
      'home':(context)=>HomeScreen(),
    },
  ));
}