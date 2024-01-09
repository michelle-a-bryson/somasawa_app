import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:somasawa_app/core/constants/student_levels.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';
import 'package:somasawa_app/core/utils/validators.dart';

class EditClassInfo extends StatefulWidget {
  final Map<String, dynamic> classData;

  EditClassInfo(this.classData);

  @override
  State<EditClassInfo> createState() => _EditClassInfoState();
}

class _EditClassInfoState extends State<EditClassInfo> {
  List<String> categories = [];

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
            Text(
              "Add a Class Information",
              style: headingH5Medium500,
            ),
            SizedBox(height: 8.0),
            Text(
              "Input a class information assigned to you for upcoming term.",
              style: paragraphMediumRegular400,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                // Dropdown for term
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Term", style: paragraphSmallMedium500),
                      SizedBox(height: 4.0),
                      DropdownButtonFormField2<String>(
                        items: ["Term 1", "Term 2", "Term 3"]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.classData['term'] = value;
                          });
                        },
                        value: widget.classData['term'],
                        hint: Text("Select"),
                        validator: (value) =>
                            validateValueForm(value, 'Please select a term'),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary400),
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
                      Text("Year", style: paragraphSmallMedium500),
                      SizedBox(height: 4.0),
                      DropdownButtonFormField2<String>(
                        items: ["2023", "2024", "2025"]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.classData['schoolYear'] = value;
                          });
                        },
                        value: widget.classData['schoolYear'],
                        hint: Text("Select"),
                        validator: (value) => validateValueForm(
                            value, 'Please select a school year'),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary400),
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
            Text("Start Date", style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Select date",
                suffixIcon: Icon(Icons.calendar_today),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary400),
                ),
              ),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2025),
                  builder: (context, child) => Theme(
                    data: ThemeData().copyWith(
                      colorScheme: ColorScheme.light(
                        primary: primary500,
                        onPrimary: Colors.white,
                        surface: neutralWhite,
                        onSurface: Colors.black,
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  ),
                );
                if (date != null) {
                  setState(() {
                    widget.classData['startDate'] = date;
                  });
                }
              },
              validator: (value) =>
                  validateValueForm(value, 'Please select a start date'),
              readOnly: true,
              controller: TextEditingController(
                text: widget.classData['startDate'] == null
                    ? ''
                    : widget.classData['startDate'].toString().substring(0, 10),
              ),
            ),
            SizedBox(height: 16.0),
            // Dropdown for subject
            Text("Subject", style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
            DropdownButtonFormField2<String>(
              items: ["Math", "Literature"]
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.classData['subject'] = value;
                  widget.classData['level'] = null;
                  if (value == "Math") {
                    categories = mathLevel;
                  } else {
                    categories = litLevel;
                  }
                });
              },
              value: widget.classData['subject'],
              hint: Text(
                "Select a Subject",
                style: paragraphMediumMedium500,
              ),
              validator: (value) =>
                  validateValueForm(value, 'Please select a subject'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
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
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary400),
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "*Tip: Remember to create separate classes for each subject, like one for Literacy and another for Numeracy.",
            ),
            SizedBox(height: 16.0),
            Text("Class Time", style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
            DropdownButtonFormField2<String>(
              items: ["AM - Morning", "PM - Afternoon or Evening"]
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.classData['classTime'] = value == "AM - Morning"
                      ? "AM"
                      : "PM - Afternoon or Evening";
                });
              },
              value: widget.classData['classTime'] == "AM"
                  ? "AM - Morning"
                  : "PM - Afternoon or Evening",
              hint: Text("Select morning or noon"),
              validator: (value) =>
                  validateValueForm(value, 'Please select a class time'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
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
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary400),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Level of students", style: paragraphSmallMedium500),
            SizedBox(height: 4.0),
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
                  widget.classData['level'] = value;
                });
              },
              value: widget.classData['level'],
              hint: Text("Select level(s)"),
              validator: (value) =>
                  validateValueForm(value, 'Please select a level'),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
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
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary400),
                ),
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
