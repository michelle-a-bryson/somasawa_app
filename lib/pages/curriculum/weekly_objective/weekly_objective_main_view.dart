import 'package:flutter/material.dart';
import 'package:somasawa_app/pages/curriculum/set_up_class/set_up_class.dart';
//import 'package:somasawa_app/pages/curriculum/weekly_objective/calendar_views/calendar_view.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/calendar_views/combined_calendar_view.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/class_listing.dart';
//import 'package:somasawa_app/pages/curriculum/weekly_objective/calendar/calendar.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/objectives.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:somasawa_app/styles/texts.dart';

class WeeklyObjectiveView extends StatefulWidget {
  const WeeklyObjectiveView({super.key});

  @override
  State<WeeklyObjectiveView> createState() => _WeeklyObjectiveViewState();
}

class _WeeklyObjectiveViewState extends State<WeeklyObjectiveView> {

  void _navigateToClasses() {
    //this function handles the routing logic to navigate to the classes page
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ClassListing()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("Curriculum", style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(
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
                label: const Text('Add new term'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SetUpClass()),  //logic that reroutes the user to the SetUpClass() page
                  );
                },
                style: ButtonStyle(  //defines the style of the button
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
                      child: IconButton(  //logic to redirect the user to the list of active and archived classes needs to be implemented here
                        onPressed: _navigateToClasses,  //call on the navigate to classes function
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
              dividerColor: neutral200,
              indicatorColor: primary500,
              indicatorSize:
                  TabBarIndicatorSize.tab, // Set the indicator size to tab
              tabs: const [
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
                  const CombinedCalendarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
