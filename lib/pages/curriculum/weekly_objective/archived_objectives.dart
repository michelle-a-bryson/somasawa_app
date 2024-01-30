//Similar to Objective view but with some differences in regards to being only view only mode
// archived_objective_view.dart
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:material_symbols_icons/symbols.dart';

class ArchivedObjectiveView extends StatelessWidget {
  final String termGoal;  //accepts term goal as a string parameter
  final List<String> weekDateRanges;

  const ArchivedObjectiveView({
    Key? key,
    required this.termGoal,
    required this.weekDateRanges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(height: 16),
          Text(
            "Term goal",
            style: TextStyle(
              // Style for term goal heading
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            // Container for term goal content
            child: Text(termGoal),
          ),
          SizedBox(height: 24),
          Text(
            "Weekly objectives",
            style: TextStyle(
              // Style for weekly objectives heading
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Objectives for each week",
            style: TextStyle(
              // Style for the description text
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: weekDateRanges.map((week) {
              int index = weekDateRanges.indexOf(week);
              return Container(
                // Container for weekly objectives list items
                child: Text("Week ${index + 1} - $week"),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
