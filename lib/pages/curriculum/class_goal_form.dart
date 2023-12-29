import 'package:flutter/material.dart';

class GoalForm extends StatefulWidget {
  final Map<String, dynamic> formData;
  final GlobalKey<FormState> formKey;

  GoalForm(this.formData, this.formKey);

  @override
  State<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Goal"),
            // Add a text input field for entering the goal
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Goal'),
              onSaved: (value) {
                setState(() {
                  widget.formData['goal'] = value;
                });
              },
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter goal';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
