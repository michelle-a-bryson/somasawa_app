import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'components/group_activities.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Agenda',
          style: TextStyle(color: Colors.white),
        ), //sets the title of the appbar
        backgroundColor: primary500, //sets the background color of the appbar
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: double.infinity,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: neutral100),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.week,
              onFormatChanged: (CalendarFormat format) {
                log("format changed");
                // print(format);
              },
            ),
          ),
          Text('Week 1',
              style: paragraphMediumBold700.copyWith(color: accentJadebody)),

          Text(
            'July 11, Tuesday',
            style: headingH5Medium500,
          ),
          Text(
            'Start planning the daily agenda by adding daily activites',
            style: paragraphMediumRegular400,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    primary500, //changed from primary, secondary --> foreground, background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), //Rounds the corners of the buttons.
                ),
                // margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                padding:
                    EdgeInsets.all(16), //sets the padding inside the button
              ),
              child: Center(
                  child: Text(
                "+ Add daily activity",
                style: paragraphMediumMedium500.copyWith(color: Colors.white),
              ))),

          // GroupActivities(),
          GroupActivities(),
          AddGroupButton()
        ])),
      ),
    );
  }
}

class AddGroupButton extends StatelessWidget {
  const AddGroupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add group",
              style: paragraphMediumMedium500.copyWith(color: primary500),
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.add_circle_sharp,
              size: 48,
              color: primary500,
            )
          ],
        ),
      ),
    );
  }
}
