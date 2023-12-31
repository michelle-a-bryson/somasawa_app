import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class AddObjective extends StatefulWidget {
  final int index;
  final Function addObjective;

  const AddObjective(
      {super.key, required this.index, required this.addObjective});

  @override
  State<AddObjective> createState() => _AddObjectiveState();
}

class _AddObjectiveState extends State<AddObjective> {
  final TextEditingController textController = TextEditingController();
  String goal = '';

  @override
  void initState() {
    super.initState();
    textController.removeListener(() {
      setState(() {
        goal = textController.text;
      });
    });
    textController.addListener(() {
      setState(() {
        goal = textController.text;
      });
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week ${widget.index + 1} objective",
            style: const TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: neutralWhite, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Add a weekly objective", style: headingH5Medium500),
            ),
            SizedBox(height: 8),
            Stack(
              children: [
                // Add a text input field for entering the goal
                Container(
                  color: neutralWhite,
                  child: TextField(
                    controller: textController, // Set the text controller
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
                    onChanged: (value) => textController.text = value,
                    maxLines: 6,
                  ),
                ),
                // Floating Action Button
                if (goal.isNotEmpty)
                  Positioned(
                    bottom: 5,
                    right: 16.0,
                    child: FloatingActionButton.extended(
                      elevation: 0,
                      backgroundColor: neutralWhite,
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
            if (goal.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 16),
                  // Add a save button
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform save operation
                        widget.addObjective(textController.text);
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        width: 60, // Make the button as wide as possible
                        child: Text(
                          'Save',
                          style: TextStyle(color: neutralWhite),
                          textAlign: TextAlign.center,
                        ),
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
