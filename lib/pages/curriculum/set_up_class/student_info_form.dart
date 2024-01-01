import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class StudentForm extends StatefulWidget {
  final Map<String, dynamic> formData;
  final GlobalKey<FormState> formKey;

  StudentForm(this.formData, this.formKey);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final List<String> existingStudents = [
    "John Doe",
    "John Smith",
    "Jane Smith"
  ];
  final List<String> selectedStudents = [];
  String? selectedValue;
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add students",
              style: headingH5Medium500,
            ),
            SizedBox(height: 8.0),
            Text(
              "Add students for the class by searching the student’s full name.",
              style: paragraphMediumRegular400,
            ),
            SizedBox(height: 16.0),
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
                    if (widget.formData['students'] == null) {
                      widget.formData['students'] = [];
                    }
                    widget.formData['students'].add(student);
                    selectedStudents.add(student);
                    textController.clear();
                  });
                },
                emptyBuilder: (context) {
                  // Display an option to add a new student if no existing students match the search
                  return ListTile(
                    title: Text('Add New Student: ${textController.text}'),
                    onTap: () {
                      setState(() {
                        if (widget.formData['students'] == null) {
                          widget.formData['students'] = [];
                        }
                        widget.formData['students'].add(textController.text);
                        selectedStudents.add(textController.text);
                        textController.clear();
                      });
                    },
                  );
                }),

            if (widget.formData['students'] != null &&
                widget.formData['students'].length > 0)
              Column(
                children: [
                  SizedBox(height: 16.0),
                  Text("${widget.formData['students'].length} students added",
                      style: paragraphSmallMedium500),
                  SizedBox(height: 16.0),
                ],
              ),
            if (widget.formData['students'] == null ||
                widget.formData['students'].length == 0)
              Column(
                children: [
                  SizedBox(height: 8.0),
                  Text(
                      "*Tip: You can skip this step for now and add students by editing class before planning daily agenda.",
                      style: paragraphSmallRegular400),
                ],
              ),

            // Container to display selected student names
            Column(
              children: widget.formData['students'] == null
                  ? []
                  : List<Widget>.from(
                      widget.formData['students'].map((student) {
                        int index =
                            widget.formData['students'].indexOf(student);
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
                                      widget.formData['students']
                                          .removeAt(index);
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
    );
  }
}
