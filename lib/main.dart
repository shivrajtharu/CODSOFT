import 'package:alarm_clock_app/Screens/alarm_management_screen.dart';
import 'package:alarm_clock_app/Screens/alarm_setting_screen.dart';

import 'package:alarm_clock_app/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home':(context)=>const BotNavBar(),
      'set':(context)=>const AlarmSettingScreen(),
      'manage':(context)=>const AlarmManagementScreen(),
    },
  ));
}