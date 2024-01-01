import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: double.infinity,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
            onFormatChanged: (CalendarFormat format) {
              log("fasd");
              print(format);
            },
          ),
          Text('Week 1'),
          Text('July 11, Tuesday'),
          Text('Start planning the daily agenda by adding daily activites'),
          Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              width: double.infinity,
              child: Center(
                  child: Text(
                "+ Add daily activity",
                style: TextStyle(color: Colors.white),
              ))),
          GroupActivities(),
          GroupActivities(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Add group"), Icon(Icons.add_circle_sharp)],
            ),
          )
        ])),
      ),
    );
  }
}

class GroupActivities extends StatelessWidget {
  const GroupActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: Color(0xffced6f4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              children: [
                Text("Group #1"),
                Spacer(),
                Icon(Icons.circle),
                Text("7 students"),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            // height: 56,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.circle),
                    Expanded(
                      child: Text(
                        "Reading the first person narrative with 2 paragraphs paragraphsparagraphsparagraphsparagraphs",
                        style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        //checkbox
                        Checkbox(
                            value: false,
                            onChanged: (value) {
                              print(value);
                            }),

                        Text("Add to agenda"),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    )),
                Container(
                    height: 56,
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.blue)),
                    child: Row(
                      children: [
                        //checkbox
                        Checkbox(value: false, onChanged: (value) {}),

                        Text("Add to agenda"),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.blue),
                    ),
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "+ Add daily activity",
                      style: TextStyle(color: Color.fromARGB(255, 1, 132, 240)),
                    ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
