import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'components/add_group.dart';
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
          AddGroupWidget(),
          SingleComment(),
          SingleComment(),
          SingleComment(),
          SizedBox(
            height: 32,
          ),
          CommentBox()
        ])),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(18, 40, 18, 8),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1.0, color: neutral100),
          ),
        ),
        child: Column(
          children: [
            TextField(
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Write a comment...",
                  hintStyle:
                      paragraphMediumMedium500.copyWith(color: neutral400),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: neutral100,
                  focusColor: Colors.blue,
                  hoverColor: Colors.black),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("@ Tag someone",
                    style: paragraphSmallMedium500.copyWith(color: neutral500)),
                GestureDetector(
                  onTap: () {
                    log("Send button tapped");
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor:
                        primary500, // Change this to your desired color
                    child: Icon(
                      Icons.send, // Change this to your desired icon
                      size: 18,
                      color: Colors.white, // Change this to your desired color
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class SingleComment extends StatelessWidget {
  const SingleComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 24, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1.0, color: neutral100),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: primary50,
              radius: 14,
              child: Icon(
                Icons.chat_bubble,
                color: primary500,
                size: 12,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Jane Mood",
              style:
                  paragraphLargeMedium500.copyWith(color: primary600Original),
            ),
            Text(
              "(Me)",
              style: paragraphOverlineSmall.copyWith(color: primary300),
            ),
            Spacer(),
            Text(
              "JUL 11",
              style: paragraphSmallBold700.copyWith(color: neutral500),
            ),
            Icon(Icons.more_horiz, color: primary500)
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "@Joyce Wood Hello, please review my week 1 lesson plan. \nCan you cover for me on Wednesday?",
          style: paragraphMediumRegular400.copyWith(color: neutralBlack),
        ),
      ]),
    );
  }
}

class AddGroupWidget extends StatelessWidget {
  const AddGroupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Center(
        child: GestureDetector(
          onTap: () {
            log("Add group button tapped");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddGroup(),
              ),
            );
          },
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
      ),
    );
  }
}
