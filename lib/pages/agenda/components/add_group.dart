import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class AddGroup extends StatefulWidget {
  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  TextEditingController _activityInputController = new TextEditingController(),
      _groupNameController = TextEditingController(text: "Group #1");

  List<String> errorTexts = [
    "Group name shouldn't be empty",
    "Please add students by searching individually",
    "Please input a weekly objective by serahcing keyword",
    "Please enter a daily activity"
  ];
  bool readOnlyStatus = true;
  List<bool> emptyValues = [false, false, false, false];

  List<String> allStudents = [
    "Sarah long",
    "Jason acara",
    "John doe",
    "Hannah George"
  ];
  List<String> addedStudents = [];

  List<String> filteredOptions = [];

  void filterOptions(String input) {
    log("Filtering options $input");
    setState(() {
      filteredOptions = allStudents
          .where((option) => option.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
    print(filteredOptions);
  }

  String weeklyObjective =
      "Reading the first person narrative with 2 paragraphs paragraphs paragraphsparagraphsparagraphs";

  Text? errorExists(int index) {
    if (emptyValues[index]) {
      return Text(
        errorTexts[index],
        style: paragraphSmallRegular400.copyWith(color: error500),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                "Add a daily activity",
                style: headingH5Medium500,
              ),
              Text(
                  style: paragraphMediumRegular400,
                  "Created a daily activity for the assigned weekly objective and group of students"),
              Container(
                width: MediaQuery.of(context).size.width,
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
                    Expanded(
                      child: TextField(
                        controller: _groupNameController,
                        onChanged: (value) {
                          log("Textfield value changed $value");
                          setState(() {
                            emptyValues[0] = value.isEmpty;
                            _groupNameController.text = value;
                          });
                        },
                        autofocus: !readOnlyStatus,
                        onEditingComplete: () {
                          log("Editing is complete");
                          setState(() {
                            readOnlyStatus = true;
                          });
                        },
                        readOnly: readOnlyStatus,
                        style: headingH7Medium500,
                        decoration: InputDecoration(
                          error: errorExists(0),
                          border: InputBorder.none,
                          hintText: "Add a group of students",
                          hintStyle:
                              headingH7Medium500.copyWith(color: neutral400),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          readOnlyStatus = false;
                        });
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                      ),
                      iconSize: 25,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Add students",
                style: headingH7Medium500,
              ),
              TextField(
                onChanged: (value) {
                  log("Textfield value changed $value");
                  setState(() {
                    emptyValues[1] = value.isEmpty;
                    filterOptions(value);
                  });
                },
                onEditingComplete: () {
                  log("edit complete");
                },
                decoration: InputDecoration(
                    error: errorExists(1),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search student name'),
              ),
              SizedBox(
                height: 8,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredOptions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredOptions[index]),
                      onTap: () {
                        log("Pressed ${filteredOptions[index]}");
                        // Handle option selection here
                        // For example, you can assign the selected option back to the text field
                        setState(() {
                          addedStudents.add(filteredOptions[index]);
                        });
                      },
                    );
                  }),
              Row(
                children: [
                  Icon(Icons.add_circle_outlined, color: primary500),
                  GestureDetector(
                    onTap: () {
                      log("Add all students button pressed");
                      setState(() {
                        addedStudents = allStudents.toList();
                      });
                    },
                    child: Text(
                      "Add all students of the class",
                      style: paragraphSmallBold700.copyWith(color: primary500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 5,
                children: [
                  ...[
                    for (var i = 0; i < addedStudents.length; i++)
                      Chip(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: primary500, width: 1),
                          borderRadius: BorderRadius.circular(
                              30), //Rounds the corners of the buttons.
                        ),
                        label: Text(
                          addedStudents[i],
                          style: paragraphSmallMedium500.copyWith(
                              color: primary500),
                        ),
                        deleteIconColor: primary500,
                        onDeleted: () {
                          log("Delete button pressed");
                          setState(() {
                            addedStudents.removeAt(i);
                          });
                        },
                      ),
                  ]
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Assign weekly objective",
                style: headingH7Bold700,
              ),
              weeklyObjective.length == 0
                  ? TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          error: errorExists(2),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search a weekly objective'),
                    )
                  : Row(children: [
                      Icon(
                        Icons.flag,
                        color: error600,
                      ),
                      Expanded(
                        child: Text(
                          weeklyObjective,
                          style: paragraphMediumMedium500.copyWith(
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weeklyObjective = "";
                          });
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                        ),
                        iconSize: 25,
                      )
                    ]),
              SizedBox(height: 32),
              Text(
                "Add an activity",
                style: headingH7Bold700,
              ),
              TextField(
                minLines: 3,
                controller: _activityInputController,
                onChanged: (value) {
                  setState(() {
                    emptyValues[3] = value.isEmpty;
                    _activityInputController.text = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    error: errorExists(3),
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
                maxLines: 4,
              ),
              GestureDetector(
                onTap: () {
                  log("Create now button pressed");
                  if (_groupNameController.text.isEmpty) {
                    emptyValues[0] = true;
                  }

                  if (addedStudents.length == 0) {
                    emptyValues[1] = true;
                  }
                  if (weeklyObjective.isEmpty) {
                    emptyValues[2] = true;
                  }
                  if (_activityInputController.text.isEmpty) {
                    emptyValues[3] = true;
                  }

                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  decoration: BoxDecoration(
                      color: primary500,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text("Create now",
                        style: paragraphMediumMedium500.copyWith(
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
