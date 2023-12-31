import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class EditObjective extends StatefulWidget {
  final int index;
  final String initialObjective;
  final Function editObjective;

  const EditObjective(
      {Key? key,
      required this.index,
      required this.initialObjective,
      required this.editObjective})
      : super(key: key);

  @override
  State<EditObjective> createState() => _EditObjectiveState();
}

class _EditObjectiveState extends State<EditObjective> {
  late TextEditingController textController;
  String editedGoal = '';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initialObjective);
    textController.addListener(() {
      setState(() {
        editedGoal = textController.text;
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
        title: Text("Edit Week ${widget.index + 1} objective",
            style: const TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: neutralWhite,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child:
                  Text("Edit the weekly objective", style: headingH5Medium500),
            ),
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  color: neutralWhite,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary400),
                      ),
                      hintText: "Type your edited goal statement",
                      hintTextDirection: TextDirection.ltr,
                      hintStyle: TextStyle(color: neutral400),
                    ),
                    onChanged: (value) => textController.text = value,
                    maxLines: 6,
                  ),
                ),
                if (editedGoal.isNotEmpty)
                  Positioned(
                    bottom: 5,
                    right: 16.0,
                    child: FloatingActionButton.extended(
                      elevation: 0,
                      backgroundColor: neutralWhite,
                      onPressed: () {
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
            if (editedGoal.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.editObjective(widget.index, textController.text);
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        width: 60,
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
