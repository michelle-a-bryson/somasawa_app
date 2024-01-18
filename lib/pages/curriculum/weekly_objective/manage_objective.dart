import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/add_objective.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/edit_objective.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';
import 'package:somasawa_app/core/utils/bottom_modal.dart';

class ManageObjective extends StatefulWidget {
  final int index;
  final String week;

  const ManageObjective({super.key, required this.index, required this.week});

  @override
  State<ManageObjective> createState() => _ManageObjectiveState();
}

class _ManageObjectiveState extends State<ManageObjective> {
  // final objectives = [
  //   "Reading through the first paragraph of the book",
  //   "Reading through the second paragraph of the book",
  // ];
  final objectives = [];

  void addObjective(String objective) {
    setState(() {
      objectives.add(objective);
    });
  }

  void editObjective(int index, String editedObjective) {
    setState(() {
      objectives[index] = editedObjective;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Week ${widget.index + 1} objectives",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: neutralWhite, //change your color here
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.week, style: headingH5Medium500),
          ),
          const SizedBox(height: 24),
          if (objectives.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  for (var i = 0; i < objectives.length; i++)
                    Container(
                      decoration: BoxDecoration(
                        color: neutralWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 16),
                            title: Text(
                              objectives[i],
                              style: paragraphMediumMedium500,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Symbols.more_horiz_rounded,
                                size: 30,
                                color: primary500,
                              ),
                              onPressed: () {
                                showBottomModal(
                                  context,
                                  objectives[i],
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text("Edit",
                                            style: paragraphMediumRegular400),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditObjective(
                                                index: i,
                                                initialObjective: objectives[i],
                                                editObjective: editObjective,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Delete",
                                            style: TextStyle(color: error500)),
                                        onTap: () {
                                          setState(() {
                                            objectives.removeAt(i);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            leading: Container(
                              decoration: BoxDecoration(
                                color: error100,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Symbols.sports_score_rounded,
                                color: error500,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: neutral100,
                              color: accent500Main,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Symbols.checklist_rounded,
                                  color: neutral500,
                                ),
                                const SizedBox(width: 8),
                                Text("2/4",
                                    style: TextStyle(color: neutral500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                  Text("Add new objective",
                      style: TextStyle(
                        color: primary500,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  const SizedBox(height: 12),
                  IconButton(
                    icon: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: primary500,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Symbols.add,
                        size: 24,
                        color: neutralWhite,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddObjective(
                            index: widget.index,
                            addObjective: addObjective,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          if (objectives.isEmpty)
            Column(
              children: [
                Container(
                  height: 240,
                  color: Colors.white,
                  child: SvgPicture.asset(
                    "assets/no_weekly_objective.svg",
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "No weekly objective",
                        style: headingH4Bold700,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Please add your teaching objectives in our learning app to start planning.",
                        style: paragraphSmallRegular400,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddObjective(
                                  index: widget.index,
                                  addObjective: addObjective,
                                ),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Symbols.add,
                                color: Colors.white,
                                size: 16,
                                weight: 600,
                              ),
                              SizedBox(width: 16),
                              Text(
                                "Add a weekly objective",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
