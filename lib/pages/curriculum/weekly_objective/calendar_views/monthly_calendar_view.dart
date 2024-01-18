import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendarView extends StatefulWidget {
  const MonthlyCalendarView({Key? key}) : super(key: key);

  @override
  _MonthlyCalendarViewState createState() => _MonthlyCalendarViewState();
}

class _MonthlyCalendarViewState extends State<MonthlyCalendarView> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  late List<DropdownMenuItem<int>> _monthDropdownItems;
  late int _selectedMonthIndex;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _selectedMonthIndex = _focusedDay.month - 1; // Months are 1-indexed
    _monthDropdownItems = List.generate(12, (index) {
      return DropdownMenuItem<int>(
        child: Text(DateFormat('MMMM').format(DateTime(0, index + 1))),
        value: index,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        _buildCalendarHeader(),
    TableCalendar(
    firstDay: DateTime.utc(2020, 1, 1),
    lastDay: DateTime.utc(2030, 12, 31),
    focusedDay: _focusedDay,
    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
    calendarFormat: _calendarFormat,
    onDaySelected: (selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    });
    }
    },
    onFormatChanged: (format) {
    if (_calendarFormat != format) {
    setState(() {
    _calendarFormat = format;
    });
    }
    },
    onPageChanged: (focusedDay) {
    _focusedDay = focusedDay;
    },
    // Configure other properties accordingly
    ),
    // Add your event list or other UI components below
    ],
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      width: 328,
      height: 56,
      padding: const EdgeInsets.only(top: 4, left: 16, right: 12, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(  //needed to specify <int>
              value: _selectedMonthIndex,
              items: _monthDropdownItems,
              onChanged: (int? newIndex) {
                if (newIndex != null) {
                  setState(() {
                    _selectedMonthIndex = newIndex;
                    _focusedDay = DateTime(_focusedDay.year, newIndex + 1);
                  });
                }
              },
              style: TextStyle(
                color: Color(0xFF49454F),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            DateFormat('yyyy').format(_focusedDay),
            style: TextStyle(
              color: Color(0xFF49454F),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          // Navigation Arrows can be adjusted or removed as needed
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(_focusedDay.year - 1, _focusedDay.month);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(_focusedDay.year + 1, _focusedDay.month);
              });
            },
          ),
        ],
      ),
    );
  }
}




