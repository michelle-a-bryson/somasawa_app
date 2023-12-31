import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class ObjectiveView extends StatefulWidget {
  ObjectiveView({super.key});

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView> {
  final List<String> weeks = [
    "JUL 10 - JUL 16, 2023",
    "JUL 17 - JUL 23, 2023",
    "JUL 24 - JUL 30, 2023",
    "JUL 31 - AUG 6, 2023",
    "AUG 7 - AUG 13, 2023",
    "AUG 14 - AUG 20, 2023",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Term goal",
            style: headingH5Medium500,
          ),
          SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              color: neutralWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: neutral100),
            ),
            child: ListTile(
              title: Text("Goal", style: paragraphMediumRegular400),
              trailing: IconButton(
                icon: const Icon(Symbols.edit),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Weekly objectives",
            style: headingH5Medium500,
          ),
          SizedBox(height: 8.0),
          Text(
            "Start planning the class by setting objectives",
            style: paragraphSmallRegular400,
          ),
          SizedBox(height: 16),
          Column(
            children: List<Widget>.from(
              weeks.map((week) {
                int index = weeks.indexOf(week);
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: neutralWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primary50,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Text("Week ${index + 1}",
                                  style: TextStyle(
                                    color: primary500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(week),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Symbols.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text("Add more weeks",
                    style: TextStyle(
                      color: primary500,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 8.0),
                IconButton(
                  icon: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: neutralWhite,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: primary500),
                    ),
                    child: const Icon(
                      Symbols.add,
                      size: 24,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Edit the class setting",
            style: headingH5Medium500,
          ),
          SizedBox(height: 8.0),
          Text(
            "You can edit the class setting such as student lists, level of students.",
            style: paragraphSmallRegular400,
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(primary500),
                backgroundColor: MaterialStateProperty.all<Color>(neutralWhite),
              ),
              onPressed: () {},
              icon: Icon(Symbols.settings),
              label: Text(
                "Edit the class",
                style: TextStyle(color: primary500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
