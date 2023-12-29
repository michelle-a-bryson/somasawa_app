import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Student"),
            SizedBox(height: 16.0),
            // Search bar with dropdown for existing students
            TypeAheadField<String>(
                controller: textController,
                builder: (context, controller, focusNode) => TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Search for existing students",
                      ),
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
            SizedBox(height: 16.0),
            // Container to display selected student names
            Container(
              height: 100.0, // Adjust the height as needed
              child: ListView.builder(
                itemCount: widget.formData['students'] == null
                    ? 0
                    : widget.formData['students'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.formData['students'][index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.formData['students'].removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
