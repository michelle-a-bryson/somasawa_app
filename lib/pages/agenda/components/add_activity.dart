import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class AddActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _activityInputController =
        new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Colors.white, size: 30 //change your color here
                ),
        title: const Text(
          'Add a new activity',
          style: TextStyle(color: Colors.white),
        ), //sets the title of the appbar
        backgroundColor: primary500, //sets the background color of the appbar
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Week 1 - 11/07/2023",
                  style: paragraphMediumBold700.copyWith(
                      color: accentJadebody, backgroundColor: accent500Main)),
              Text(
                "Add a new activity",
                style: headingH5Medium500,
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: neutral200)),
                child: Row(
                  children: [
                    Icon(
                      Icons.group,
                      color: primary400,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Group #1",
                      style: headingH7Medium500,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: neutral200)),
                child: Row(
                  children: [
                    Icon(
                      Icons.flag,
                      color: primary400,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "Reading the first person narrative with 2 paragraphs paragraphs paragraphsparagraphsparagraphs",
                        style: headingH7Medium500,
                      ),
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 25,
                    )
                  ],
                ),
              ),
              // Text("read"),
              SizedBox(
                height: 32,
              ),
              Text(
                "Add an activity",
                style: headingH7Medium500,
              ),

              TextField(
                minLines: 2,
                // controller: _activityInputController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: GestureDetector(
                      onTap: () {
                        log("Done button pressed");
                      },
                      child: Text(
                        "Done",
                        style: headingH7Bold700.copyWith(color: primary400),
                      ),
                    ),
                    hintText: 'Type the new activity sentence or keyword'),
                maxLines: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    log("Save button pressed");
                  },
                  child: Text("Save",
                      style: paragraphMediumMedium500.copyWith(
                          color: Colors.white))),

              Text(
                "Suggested",
                style: TextStyle(color: primary600Original),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: neutral200)),
                child: GestureDetector(
                  onTap: () {
                    log(_activityInputController.text);
                    _activityInputController.text =
                        "Students take turn reading a short picture book.";
                  },
                  child: Text(
                    "Students take turn reading a short picture book.",
                    style: paragraphSmallRegular400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
