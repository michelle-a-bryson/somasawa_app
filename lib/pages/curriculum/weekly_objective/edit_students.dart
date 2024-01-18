import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class EditStudents extends StatefulWidget {
  final List<String> students;

  EditStudents(this.students);

  @override
  State<EditStudents> createState() => _EditStudentsState();
}

class _EditStudentsState extends State<EditStudents> {
  final TextEditingController textController = TextEditingController();
  final List<String> existingStudents = [
    "John Doe",
    "John Smith",
    "Jane Smith"
  ];

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit students",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: neutralWhite, //change your color here
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 24, bottom: 76, left: 16, right: 16),
        child: ListView(
          children: [
            Text("Search student", style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
            // Search bar with dropdown for existing students
            TypeAheadField<String>(
                controller: textController,
                builder: (context, controller, focusNode) => TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: const OutlineInputBorder(),
                          hintText: "Type student name",
                          hintStyle: TextStyle(color: neutral400)),
                    ),
                suggestionsCallback: (pattern) {
                  // Filter existing students based on the search pattern
                  return existingStudents
                      .where((student) =>
                          student.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, student) {
                  // Display existing student suggestions
                  return ListTile(
                    title: Text(student),
                    tileColor: Colors.white,
                  );
                },
                onSelected: (student) {
                  // Add selected student to the list
                  // print(student);
                  setState(() {
                    widget.students.add(student);
                    textController.clear();
                  });
                },
                emptyBuilder: (context) {
                  // Display an option to add a new student if no existing students match the search
                  return ListTile(
                    title: Text('Add New Student: ${textController.text}'),
                    onTap: () {
                      setState(() {
                        widget.students.add(textController.text);
                        textController.clear();
                      });
                    },
                  );
                }),

            if (widget.students.length > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text("${widget.students.length} students added",
                      style: paragraphSmallMedium500),
                  SizedBox(height: 16.0),
                ],
              ),
            if (widget.students.length == 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Text(
                      "*Tip: You can skip this step for now and add students by editing class before planning daily agenda.",
                      style: paragraphSmallRegular400),
                ],
              ),

            // Container to display selected student names
            Column(
              children: List<Widget>.from(
                widget.students.map((student) {
                  int index = widget.students.indexOf(student);
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: neutralWhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 16),
                          title: Text(student),
                          trailing: IconButton(
                            icon: const Icon(
                              Symbols.delete_rounded,
                              weight: 600,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.students.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 76,
        decoration: BoxDecoration(
          color: neutralWhite,
        ),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Save change", style: TextStyle(color: neutralWhite)),
        ),
      ),
    );
  }
}
