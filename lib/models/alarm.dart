import 'package:flutter/material.dart';

class Alarm {
  TimeOfDay time;
  bool isOn;

  Alarm({
    required this.time,
    this.isOn = true,
  });
}
