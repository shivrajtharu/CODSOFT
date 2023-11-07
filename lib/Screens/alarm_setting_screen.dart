import 'package:flutter/material.dart';

import 'alarm_ringing_screen.dart';

class AlarmSettingScreen extends StatefulWidget {
  const AlarmSettingScreen({Key? key}) : super(key: key);

  @override
  State<AlarmSettingScreen> createState() => _AlarmSettingScreenState();
}

class _AlarmSettingScreenState extends State<AlarmSettingScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedTone = "Default Tone";

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _selectAlarmTone(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Alarm Tone'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Tone 1'),
                onTap: () {
                  Navigator.pop(context, 'Tone 1');
                },
              ),
              ListTile(
                title: const Text('Tone 2'),
                onTap: () {
                  Navigator.pop(context, 'Tone 2');
                },
              ),
              // Add more tone options as needed.
            ],
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedTone = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Alarm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text(
                "Alarm Time",
                style: TextStyle(fontSize: 20),
              ),
              trailing: TextButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text(
                  selectedTime.format(context),
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Alarm Tone",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                selectedTone,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                _selectAlarmTone(context);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlarmRingingScreen()),
                );
                // Handle saving the selected time and tone (and any other alarm settings).
                // For example, you can use a state management solution like Provider to manage alarms.
              },
              child: const Text('Save Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
