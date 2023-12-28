//Form used for setting class goals --> requires further finetuning
import 'package:flutter/material.dart';
import 'class_info_form.dart';  //this file is currently empty

class ClassSetupPage extends StatelessWidget {
  const ClassSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set up a class'),
        backgroundColor: Colors.blue[800],
      ),
      body: const ClassInfoForm(),
    );
  }
}

