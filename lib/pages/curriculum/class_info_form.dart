import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:somasawa_app/constants/student_levels.dart';
import 'package:somasawa_app/utilities/validators.dart';

class ClassInfoForm extends StatefulWidget {
  final Map<String, dynamic> formData;
  final GlobalKey<FormState> formKey;

  ClassInfoForm(this.formData, this.formKey);

  @override
  State<ClassInfoForm> createState() => _ClassInfoFormState();
}

class _ClassInfoFormState extends State<ClassInfoForm> {
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Dropdown for term
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Class Info",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField2<String>(
                        items: ["Term 1", "Term 2", "Term 3"]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.formData['term'] = value;
                          });
                        },
                        value: widget.formData['term'],
                        hint: Text("Select"),
                        validator: (value) =>
                            validateValueForm(value, 'Please select a term'),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        decoration: InputDecoration(
                          // Add Horizontal padding using menuItemStyleData.padding so it matches
                          // the menu padding when button's width is not specified.
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                // Dropdown for school year
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Year",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField2<String>(
                        items: ["2023", "2024", "2025"]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.formData['schoolYear'] = value;
                          });
                        },
                        value: widget.formData['schoolYear'],
                        hint: Text("Select"),
                        validator: (value) => validateValueForm(
                            value, 'Please select a school year'),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        decoration: InputDecoration(
                          // Add Horizontal padding using menuItemStyleData.padding so it matches
                          // the menu padding when button's width is not specified.
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Date Picker for start date
            // DropdownButton<DateTime>(
            //   hint: Text('Choose A Date'),
            //   items: ['Choose A Date']
            //       .map((e) => DropdownMenuItem<DateTime>(
            //             child: Text(e),
            //             value:
            //                 null, // You can set an initial value here if needed
            //           ))
            //       .toList(),
            //   value: widget.formData['startDate'],
            //   onChanged: (DateTime? value) {
            //     showDatePicker(
            //       context: context,
            //       initialDate: widget.formData['startDate'] ?? DateTime.now(),
            //       firstDate: DateTime(2001),
            //       lastDate: DateTime(2099),
            //     ).then((date) {
            //       if (date != null) {
            //         setState(() {
            //           widget.formData['startDate'] = date;
            //         });
            //       }
            //     });
            //   },
            // ),
            SizedBox(height: 16.0),
            // Dropdown for subject
            Text("Subject", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField2<String>(
              items: ["Math", "Literature"]
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.formData['subject'] = value;
                  widget.formData['level'] = null;
                  if (value == "Math") {
                    categories = mathLevel;
                  } else {
                    categories = litLevel;
                  }
                });
              },
              value: widget.formData['subject'],
              hint: Text("Select a Subject"),
              validator: (value) =>
                  validateValueForm(value, 'Please select a subject'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Text(
              "*Tip: Remember to create separate classes for each subject, like one for Literacy and another for Numeracy.",
            ),
            SizedBox(height: 16.0),
            Text("Class Time", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField2<String>(
              items: ["AM - Morning", "PM - Afternoon or Evening"]
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.formData['classTime'] = value;
                });
              },
              value: widget.formData['classTime'],
              hint: Text("Select morning or noon"),
              validator: (value) =>
                  validateValueForm(value, 'Please select a class time'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Level of students",
                style: TextStyle(fontWeight: FontWeight.bold)),
            // Dropdown for categories based on subject
            DropdownButtonFormField2<String>(
              items: categories
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.formData['level'] = value;
                });
              },
              value: widget.formData['level'],
              hint: Text("Select level(s)"),
              validator: (value) =>
                  validateValueForm(value, 'Please select a level'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
