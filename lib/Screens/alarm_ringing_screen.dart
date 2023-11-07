import 'package:flutter/material.dart';

class AlarmRingingScreen extends StatelessWidget {
  const AlarmRingingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Ringing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Time to wake up!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Implement snooze functionality here
                    // For example, you can schedule the alarm to ring again after a set period.
                    Navigator.pop(context); // Close the alarm ringing screen
                  },
                  child: const Text('Snooze'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement dismiss functionality here
                    // For example, you can stop the alarm and go back to the home screen.
                    Navigator.pop(context); // Close the alarm ringing screen
                  },
                  child: const Text('Dismiss'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
