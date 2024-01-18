import 'package:flutter/material.dart';

class WeeklyCalendarView extends StatefulWidget {
  const WeeklyCalendarView({Key? key}) : super(key: key);

  @override
  _WeeklyCalendarViewState createState() => _WeeklyCalendarViewState();
}

class _WeeklyCalendarViewState extends State<WeeklyCalendarView> {
  DateTime _selectedDate = DateTime.now();

  // Dummy data for the list of events. You will replace this with your actual data source.
  final Map<DateTime, List<String>> _events = {
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)): ["19/20 Students attended", "Reading a first-person narrative with 2 paragraphs."],
    // Add more entries here
  };

  List<String> _getEventsForDay(DateTime date) {
    // In a real scenario, you would fetch the events for the specified date from a database or API.
    return _events[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // Generate the list of this week's dates
    List<DateTime> thisWeekDates = List.generate(7, (index) {
      DateTime firstDayOfTheWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
      return firstDayOfTheWeek.add(Duration(days: index));
    });

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.subtract(Duration(days: 7));
                  });
                },
              ),
              Text( //shouldn't have a text, should have the segmented button instead
                "Weekly",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.add(Duration(days: 7));
                  });
                },
              ),
            ],
          ),
        ),
        // Days of the week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: thisWeekDates.map((date) {
            return Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _selectedDate.day == date.day ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "${date.day}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // You can add more information here, such as the day of the week, etc.
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _getEventsForDay(_selectedDate).length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_getEventsForDay(_selectedDate)[index]),
                // Here you can add onTap or other functionality
              );
            },
          ),
        ),
      ],
    );
  }
}

