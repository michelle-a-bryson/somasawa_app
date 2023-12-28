import 'package:flutter/material.dart';

class ClassInfoForm extends StatefulWidget {
  const ClassInfoForm({super.key});

  @override
  _ClassInfoFormState createState() => _ClassInfoFormState();
}

class _ClassInfoFormState extends State<ClassInfoForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedTerm;
  String? selectedYear;
  DateTime? selectedDate;
  String? selectedSubject;
  String? selectedTime;
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: selectedTerm,
            hint: const Text('Select Term'),
            onChanged: (String? newValue) {
              setState(() {
                selectedTerm = newValue;
              });
            },
            items: <String>['Term 1', 'Term 2', 'Term 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Other DropdownButtons for Year, Subject, Class Time, Level of Students
          // ...
          // DatePicker for Start Date
          // ...

          ElevatedButton(
            onPressed: () {
              // Logic to save the form or navigate to the next setup page
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
