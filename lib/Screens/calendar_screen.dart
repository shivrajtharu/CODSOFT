import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
            });
          },
        ),
        Text(DateFormat('MMMM yyyy').format(_selectedDate)),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDayHeader(String label) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDay(int day) {
    bool isSelectedDay = day == _selectedDate.day;
    bool isToday = DateTime.now().day == day && DateTime.now().month == _selectedDate.month && DateTime.now().year == _selectedDate.year;
    return InkWell(
      onTap: () {
        _selectDate(DateTime(_selectedDate.year, _selectedDate.month, day));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isSelectedDay ? Colors.blue : Colors.transparent),
          borderRadius: BorderRadius.circular(8.0),
          color: isToday ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(day.toString(), style: TextStyle(fontWeight: isSelectedDay ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }

  Widget _buildCalendar() {
    List<Widget> dayHeaders = List.generate(7, (index) => _buildDayHeader(DateFormat('E').format(DateTime(4, 0, index + 1))));
    int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int startIndex = DateTime(_selectedDate.year, _selectedDate.month, 1).weekday - 1;
    List<Widget> days = List.generate(startIndex + daysInMonth, (index) {
      if (index < startIndex) {
        return Container();
      } else {
        return _buildDay(index - startIndex + 1);
      }
    });
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 7,
      children: [...dayHeaders, ...days],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar',),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMonthHeader(),
          const Divider(),
          _buildCalendar(),
        ],
      ),
    );
  }
}