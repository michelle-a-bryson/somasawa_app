import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/edit_class_info.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/edit_students.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class EditClass extends StatefulWidget {
  final Map<String, dynamic> data;

  EditClass(this.data);

  @override
  State<EditClass> createState() => _EditClassState();
}

class _EditClassState extends State<EditClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit the class",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: neutralWhite, //change your color here
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Class Information", style: headingH5Medium500),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditClassInfo(widget.data),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: primary500,
                      size: 18,
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(color: primary500),
                    )),
              ],
            ),
            SizedBox(height: 8.0),
            Container(
              // color: neutralWhite,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                color: neutralWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TERM",
                            style: TextStyle(
                                color: primary500,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.data['term']}, ${widget.data['schoolYear']}",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("START DATE",
                            style: TextStyle(
                                color: primary500,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.data['startDate']}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: neutral100,
              indent: 16,
              endIndent: 16,
            ),
            Container(
              // color: neutralWhite,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: neutralWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SUBJECT",
                            style: TextStyle(
                                color: primary500,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.data['subject']}",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CLASS TIME",
                            style: TextStyle(
                                color: primary500,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.data['classTime']}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: neutral100,
              indent: 16,
              endIndent: 16,
            ),
            Container(
              // color: neutralWhite,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: neutralWhite,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LEVEL OF STUDENTS",
                            style: TextStyle(
                                color: primary500,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.data['level']}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Students", style: headingH5Medium500),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EditStudents(widget.data['students']),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: primary500,
                      size: 18,
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(color: primary500),
                    )),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
                "${widget.data['students'] != null ? widget.data['students'].length : 0} Students added",
                style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
            Column(
              children: widget.data['students'] == null
                  ? []
                  : List<Widget>.from(
                      widget.data['students'].map((student) {
                        // int index = widget.data['students'].indexOf(student);
                        return Column(
                          children: [
                            Container(
                              color: neutralWhite,
                              child: ListTile(
                                title: Text(student),
                                leading: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary50,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: primary500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        );
                      }),
                    ),
            ),
            SizedBox(height: 24.0),
            Text(
              "Finish the class",
              style: headingH5Medium500,
            ),
            SizedBox(height: 8.0),
            Text(
              "After AUG 20, 2023, you can mark as completed.",
              style: paragraphMediumRegular400,
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(primary500),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(neutralWhite),
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: primary500)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 16)),
                ),
                onPressed: () {},
                icon: Icon(
                  Symbols.archive_rounded,
                  size: 20,
                  weight: 600,
                ),
                label: Text(
                  "Finish and save the class",
                  style: TextStyle(color: primary500),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              "Delete Class",
              style: headingH5Medium500,
            ),
            SizedBox(height: 8.0),
            Text(
              "It will permanently delete the class",
              style: paragraphMediumRegular400,
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(error500),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(0),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Symbols.delete_rounded,
                  size: 20,
                  weight: 600,
                ),
                label: Text(
                  "Delete the class",
                  style: TextStyle(
                    color: error500,
                    decoration: TextDecoration.underline,
                    decorationColor: error500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
