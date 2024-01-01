import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class SetUpForm extends StatefulWidget {
  final Map<String, dynamic> formData;
  final Function(int) goToStep;

  SetUpForm(this.formData, this.goToStep);

  @override
  State<SetUpForm> createState() => _SetUpFormState();
}

class _SetUpFormState extends State<SetUpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: ListView(
        children: [
          Text(
            "Confirm to set up a class",
            style: headingH5Medium500,
          ),
          SizedBox(height: 8.0),
          Text(
            "Please review and confirm to set up a class as below.",
            style: paragraphMediumRegular400,
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Class Information", style: headingH6Medium500),
              TextButton.icon(
                  onPressed: () {
                    widget.goToStep(0);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: primary500,
                    size: 18,
                  ),
                  label: Text(
                    "Edit",
                    style: TextStyle(color: primary500),
                  )),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            // color: neutralWhite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              color: neutralWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TERM",
                          style: TextStyle(
                              color: primary500, fontWeight: FontWeight.bold)),
                      Text(
                        "${widget.formData['term']}, ${widget.formData['schoolYear']}",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("START DATE",
                          style: TextStyle(
                              color: primary500, fontWeight: FontWeight.bold)),
                      Text(
                        "${widget.formData['startDate']}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: neutral100,
            indent: 16,
            endIndent: 16,
          ),
          Container(
            // color: neutralWhite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: neutralWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SUBJECT",
                          style: TextStyle(
                              color: primary500, fontWeight: FontWeight.bold)),
                      Text(
                        "${widget.formData['subject']}",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CLASS TIME",
                          style: TextStyle(
                              color: primary500, fontWeight: FontWeight.bold)),
                      Text(
                        "${widget.formData['classTime']}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: neutral100,
            indent: 16,
            endIndent: 16,
          ),
          Container(
            // color: neutralWhite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: neutralWhite,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LEVEL OF STUDENTS",
                          style: TextStyle(
                              color: primary500, fontWeight: FontWeight.bold)),
                      Text(
                        "${widget.formData['level']}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Students", style: headingH6Medium500),
              TextButton.icon(
                  onPressed: () {
                    widget.goToStep(1);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: primary500,
                    size: 18,
                  ),
                  label: Text(
                    "Edit",
                    style: TextStyle(color: primary500),
                  )),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
              "${widget.formData['students'] != null ? widget.formData['students'].length : 0} Students added",
              style: paragraphSmallMedium500),
          SizedBox(height: 4.0),
          Column(
            children: widget.formData['students'] == null
                ? []
                : List<Widget>.from(
                    widget.formData['students'].map((student) {
                      return Column(
                        children: [
                          Container(
                            color: neutralWhite,
                            child: ListTile(
                              title: Text(student),
                              leading: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary50,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: primary500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      );
                    }),
                  ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Goal of the term", style: headingH6Medium500),
              TextButton.icon(
                  onPressed: () {
                    widget.goToStep(2);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: primary500,
                    size: 18,
                  ),
                  label: Text(
                    "Edit",
                    style: TextStyle(color: primary500),
                  )),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            // color: neutralWhite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: neutralWhite,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4)),
            ),
            child: Row(
              children: [
                Text(
                  "${widget.formData['goal']}",
                  style: paragraphMediumRegular400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
