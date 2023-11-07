import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentTime = '';
  String currentDate = '';

  @override
  void initState() {
    super.initState();
    // Initialize the current time and date when the screen is loaded.
    updateDateTime();
  }

  void updateDateTime() {
    final now = DateTime.now();
    final timeFormatted = "${now.hour}:${now.minute}";
    final dateFormatted = "${_getWeekday(now.weekday)}, ${_getMonth(now.month)} ${now.day}, ${now.year}";

    setState(() {
      currentTime = timeFormatted;
      currentDate = dateFormatted;
    });
  }

  String _getWeekday(int weekday) {
    const weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return weekdays[weekday - 1];
  }

  String _getMonth(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30,bottom: 30),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),fit: BoxFit.fill,),
              ),
            ),
            Text(
              currentTime,
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              currentDate,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'set');
              },
              child: const Text('Set Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
