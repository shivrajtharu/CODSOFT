import 'package:flutter/material.dart';

class Alarm {
  final int id;
  final TimeOfDay time;
  final bool isEnabled;
  final String alarmTone;


  Alarm({required this.id, required this.time, required this.isEnabled, required this.alarmTone});
}