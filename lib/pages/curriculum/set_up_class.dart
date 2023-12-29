import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:somasawa_app/pages/curriculum/class_goal_form.dart';
import 'package:somasawa_app/pages/curriculum/class_info_form.dart';
import 'package:somasawa_app/pages/curriculum/confirm_set_up.dart';
import 'package:somasawa_app/pages/curriculum/student_info_form.dart';
import 'package:somasawa_app/styles/colors.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class SetUpClass extends StatefulWidget {
  const SetUpClass({super.key});

  @override
  State<SetUpClass> createState() => _SetUpClassState();
}

class _SetUpClassState extends State<SetUpClass> {
  Map<String, dynamic> formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int activeStep = 0;
  String? dropdownValue;

  void _goToPreviousStep() {
    if (activeStep > 0) {
      setState(() {
        activeStep--;
      });
    }
  }

  void _goToNextStep() {
    final form = formKeys[activeStep].currentState;
    if (form != null && form.validate()) {
      form.save();
      if (activeStep < 3) {
        setState(() {
          activeStep++;
        });
      } else {
        // Handle final step actions
        // For example, show a confirmation dialog or navigate to another screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmation'),
              content: Text('Form submitted successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Set up a class", style: TextStyle(color: Colors.white)),
        backgroundColor: primary500,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: neutral100,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: EasyStepper(
                  // enableStepTapping: false,
                  activeStep: activeStep,
                  enableStepTapping: false,
                  lineStyle: LineStyle(
                    lineLength: 60,
                    lineType: LineType.normal,
                    lineThickness: 4,
                    lineSpace: 0,
                    lineWidth: 10,
                    finishedLineColor: accent500Main,
                    activeLineColor: primary50,
                    unreachedLineColor: primary50,
                  ),
                  activeStepTextColor: primary500,
                  finishedStepTextColor: Colors.black87,
                  unreachedStepTextColor: Colors.black87,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 16,
                  showStepBorder: false,
                  activeStepBackgroundColor: accent500Main,
                  finishedStepBackgroundColor: accent500Main,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 14,
                        backgroundColor: backgroundColor(activeStep, 0),
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: activeStep < 0 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      title: 'Class Info',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 14,
                        backgroundColor: backgroundColor(activeStep, 1),
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: activeStep < 1 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      title: 'Student',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 14,
                        backgroundColor: backgroundColor(activeStep, 2),
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: activeStep < 2 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      title: 'Goal',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 14,
                        backgroundColor: backgroundColor(activeStep, 3),
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: activeStep < 3 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      title: 'Set up',
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
              ),
              displayStepForm(activeStep),
              Positioned(
                bottom: 16.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (activeStep > 0)
                      ElevatedButton(
                        onPressed: _goToPreviousStep,
                        child: Text("Back"),
                      ),
                    ElevatedButton(
                      onPressed: _goToNextStep,
                      child: Text("Continue"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color backgroundColor(int activeStep, int index) {
    if (index == activeStep) {
      return primary500;
    } else if (index < activeStep) {
      return accent500Main;
    } else {
      return primary50;
    }
  }

  Widget displayStepForm(int activeStep) {
    switch (activeStep) {
      case 0:
        return ClassInfoForm(formData, formKeys[activeStep]);
      case 1:
        return StudentForm(formData, formKeys[activeStep]);
      case 2:
        return GoalForm(formData, formKeys[activeStep]);
      case 3:
        return SetUpForm(formData);
      default:
        return Container(); // Placeholder, you can customize this based on your requirements
    }
  }
}
