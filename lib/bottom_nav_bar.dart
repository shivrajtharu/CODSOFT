import 'package:alarm_clock_app/Screens/alarm_management_screen.dart';
import 'package:alarm_clock_app/Screens/calendar_screen.dart';
import 'package:alarm_clock_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currentIndex=0;
  final screens= [
    const HomeScreen(),
    const AlarmManagementScreen(),
    const CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor:Colors.black,
        unselectedItemColor: Colors.black54,
        iconSize: 28,
        selectedFontSize: 16,
        unselectedFontSize:12,
        currentIndex:currentIndex,
        onTap:(index)=>setState(()=>currentIndex=index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_history),
            label: 'manage alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}