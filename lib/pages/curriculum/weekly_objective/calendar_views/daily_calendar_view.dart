import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyCalendarView extends StatefulWidget {
  const DailyCalendarView({Key? key}) : super(key: key);

  @override
  _DailyCalendarViewState createState() => _DailyCalendarViewState();
}

class _DailyCalendarViewState extends State<DailyCalendarView> {
  // Assume the class started on a specific date
  final DateTime _classStartDate = DateTime(2023, 1, 1);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener to the scroll controller to handle more loading items when reach the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Here you can trigger more data to be loaded
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: DateTime.now().difference(_classStartDate).inDays,
      itemBuilder: (context, index) {
        // Calculate the date for the current item
        DateTime currentDate = _classStartDate.add(Duration(days: index));
        return ListTile(
          title: Text(DateFormat('EEEE, MMMM d').format(currentDate)),
          subtitle: _buildDailyEvents(currentDate),
        );
      },
    );
  }

  Widget _buildDailyEvents(DateTime currentDate) {
    // This function should build a widget based on the events of the given date
    // For example purposes, we're just returning dummy text
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('19/20 Students attended'),
        // ... other event details
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

