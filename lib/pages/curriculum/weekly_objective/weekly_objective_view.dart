import 'package:flutter/material.dart';
import 'package:somasawa_app/pages/curriculum/set_up_class/set_up_class.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/calendar.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/objective.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/styles/texts.dart';

class WeeklyObjectiveView extends StatefulWidget {
  const WeeklyObjectiveView({super.key});

  @override
  State<WeeklyObjectiveView> createState() => _WeeklyObjectiveViewState();
}

class _WeeklyObjectiveViewState extends State<WeeklyObjectiveView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("Curriculum", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton.icon(
                icon: Icon(
                  Symbols.add_circle,
                  size: 16,
                  weight: 500,
                ),
                label: Text('Add new term'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SetUpClass()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(primary500),
                  backgroundColor: MaterialStateProperty.all<Color>(primary50),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: neutralWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primary50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Symbols.swap_horiz),
                        color: primary500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16), // Add your desired padding value here
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Term 2, 2023 - Literacy (AM)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Paragraph',
                            style: paragraphMediumRegular400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  text: 'Objective',
                ),
                Tab(
                  text: 'Calendar',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // First tab view (Objective)
                  ObjectiveView(),

                  // Second tab view (Calendar)
                  CalendarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
