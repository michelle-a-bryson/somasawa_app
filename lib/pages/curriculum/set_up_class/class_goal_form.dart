import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView(
          children: [
            Text(
              "Add goals of the term",
              style: headingH5Medium500,
            ),
            SizedBox(height: 8.0),
            Text(
              "Input a goal sentence of the term for this class.",
              style: paragraphMediumRegular400,
            ),
            SizedBox(height: 16.0),
            // Add a text input field for entering the goal
            Stack(
              children: [
                // Add a text input field for entering the goal
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary400),
                    ),
                    hintText: "Type your goal statement",
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(color: neutral400),
                  ),
                  onSaved: (value) {
                    setState(() {
                      widget.formData['goal'] = value;
                    });
                  },
                  maxLines: 6,
                ),
                // Floating Action Button
                Positioned(
                  bottom: 5,
                  right: 16.0,
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    backgroundColor: neutral100,
                    onPressed: () {
                      //close the keyboard
                      FocusScope.of(context).unfocus();
                    },
                    label: Text(
                      "Done",
                      style: TextStyle(color: primary400, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
