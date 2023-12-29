import 'package:flutter/material.dart';

class SetUpForm extends StatefulWidget {
  final Map<String, dynamic> formData;

  SetUpForm(this.formData);

  @override
  State<SetUpForm> createState() => _SetUpFormState();
}

class _SetUpFormState extends State<SetUpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Set up"),
          // Display the information entered in previous steps
          // Use the formData map to retrieve values
          Text("Term: ${widget.formData['term']}"),
          Text("School Year: ${widget.formData['schoolYear']}"),
          Text("Start Date: ${widget.formData['startDate']}"),
          Text("Subject: ${widget.formData['subject']}"),
          Text("Level: ${widget.formData['level']}"),
          Text("Student: ${widget.formData['students']}"),
          Text("Goal: ${widget.formData['goal']}"),
          // Add Edit buttons for each step
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate back to the corresponding step
          //     _goToPreviousStep();
          //   },
          //   child: Text("Edit Class Info"),
          // ),
          // // Add Edit buttons for other steps
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate back to the corresponding step
          //     _goToPreviousStep();
          //   },
          //   child: Text("Edit Student"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate back to the corresponding step
          //     _goToPreviousStep();
          //   },
          //   child: Text("Edit Goal"),
          // ),
        ],
      ),
    );
  }
}
