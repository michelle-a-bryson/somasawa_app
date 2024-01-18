import 'package:flutter/material.dart';
import 'monthly_calendar_view.dart';
import 'weekly_calendar_view.dart';
import 'daily_calendar_view.dart';


class CombinedCalendarView extends StatefulWidget {
  const CombinedCalendarView({Key? key}) : super(key: key);

  @override
  _CombinedCalendarViewState createState() => _CombinedCalendarViewState();
}

class _CombinedCalendarViewState extends State<CombinedCalendarView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const MonthlyCalendarView(),
    const WeeklyCalendarView(),
    const DailyCalendarView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCustomTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        width: 108,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: isSelected
            ? ShapeDecoration(
          color: const Color(0xFFEAEDFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        )
            : null,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? const Color(0xFF202A56) : const Color(0xFF3D4DA1),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 48,
          padding: const EdgeInsets.all(2),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: const Color(0xFFE6EBEB),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCustomTab('Monthly', 0),
              _buildCustomTab('Weekly', 1),
              _buildCustomTab('Daily', 2),
            ],
          ),
        ),
        Expanded(
          child: _views[_selectedIndex],
        ),
      ],
    );
  }
}


