import 'package:flutter/material.dart';
import '../models/alarm.dart';

class AlarmManagementScreen extends StatefulWidget {
  const AlarmManagementScreen({super.key});

  @override
  State<AlarmManagementScreen> createState() => _AlarmManagementScreenState();
}

class _AlarmManagementScreenState extends State<AlarmManagementScreen> {
  List<Alarm> alarms = [];
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void addAlarm() {
    final newAlarm = Alarm(time: selectedTime);
    setState(() {
      alarms.add(newAlarm);
    });
  }

  void toggleAlarm(int index) {
    setState(() {
      alarms[index].isOn = !alarms[index].isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Management'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Select Alarm Time"),
            trailing: TextButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text(
                selectedTime.format(context),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addAlarm();
            },
            child: const Text('Add Alarm'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];
                return ListTile(
                  title: Text(alarm.time.format(context)),
                  trailing: Switch(
                    value: alarm.isOn,
                    onChanged: (value) {
                      toggleAlarm(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
