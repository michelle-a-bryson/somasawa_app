//this is the flow from the class_listing.dart file, users should be able to view specific details in regards to the past classes information

/*
* The following logic was used to implement this:
* 1. Create a new Dart file for the detailed class screen, class_detail_view.dart
* 2. Define a ClassDetailScreen widget in the new file
* 3. in class_listing.dart, update _buildClassCard method to include a Gesture Detector (reference: https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) or InkWell (reference: https://api.flutter.dev/flutter/material/InkWell-class.html) that navigates to the ClassDetailScreen when a past class card is tapped (think of these as useState hooks in react).
* */
import 'package:flutter/material.dart';
import 'class_model.dart';
//import 'objectives.dart'; //import the objective view component in order to reuse it
import 'archived_objectives.dart';

class ClassDetailScreen extends StatelessWidget {
  final ClassModel classModel;

  ClassDetailScreen({Key? key, required this.classModel}) : super(key: key);

  var weekDateRanges = [
    'JUL 10 - JUL 16, 2022',
    'JUL 17 - JUL 23, 2022',
    'JUL 24 - JUL 30, 2022',
    'JUL 31 - AUG 6, 2022',
    'AUG 7 - AUG 13, 2022',
    'AUG 14 - AUG 20, 2022',
  ];

  @override
  Widget build(BuildContext context) {
    // Define the list of date ranges for the weeks.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Past Class',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        leading: const SizedBox(width: 48),
        leadingWidth: 0,
        actions: [
          ButtonContainer(onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildClassCard(classModel),
            buildTabSection(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                  //child: buildClassCard(classModel),
                  ),
            ),
            const SizedBox(height: 24),
            //buildTermGoalsAndObjectives(), --> this is not needed since it is already being rendered in buildTabSection
            const SizedBox(height: 24),
            ...List.generate(
              6,
              (index) => buildWeeklyObjectiveItem(index, weekDateRanges[index]),
            ),
          ],
        ),
      ),
    );
  }

//placing buildClassCard above buildTabSection will place the card above the tab as intended by the Figma Design within the build function
  Widget buildClassCard(ClassModel classModel) {
    //similar to the _buildClassCard in class_listing.dart file
    return Container(
      width: 328,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE6EBEB)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFEAEDFA),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(Icons.swap_horiz,
                color:
                    Color(0xFF1E1F1F)), //changed icon from book to swap_horiz
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classModel.title,
                  style: TextStyle(
                    color: Color(0xFF1E1F1F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Term: ${classModel.term}',
                  style: TextStyle(
                    color: Color(0xFF65696B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabSection() {
    //we will need to declare the list here again and render it as intended
    // ignore: unnecessary_new
    var classRanges = new List(6); //initialize an empty list
    //assign values to each of them
    classRanges[0] = 'JUL 10 - JUL 16, 2022';
    classRanges[1] = 'JUL 17 - JUL 23, 2022';
    classRanges[2] = ''

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Color(0xFF0E1E6D),
            labelColor: Color(0xFF1E1F1F),
            tabs: [
              Tab(text: 'Objectives'),
              Tab(text: 'Calendar'),
            ],
          ),
          // Removed Expanded around TabBarView
          Container(
            height:
                300, // Give a fixed height or use another method to constrain the height
            // ignore: prefer_const_constructors
            child: TabBarView(
              children: const [
                ArchivedObjectiveView("Read the first page", weekDateRanges),
                //buildObjectivesContent(),
                Center(
                    child: Text(
                        'Calendar Content, defined elsewhere, needs to be imported and adjusted')),
              ],
            ),
          ),
        ],
      ),
    );
  }

/**Note that the following was the original buildTabSection
 * 
 *  Widget buildTabSection() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        TabBar(
          indicatorColor: Color(0xFF0E1E6D),
          labelColor: Color(0xFF1E1F1F),
          tabs: [
            Tab(text: 'Objectives'),
            Tab(text: 'Calendar'),
          ],
        ),
        Expanded( // Use Expanded to fill the available space
          child: TabBarView(
            children: [
              buildObjectivesContent(), // Build objectives content here, widget defined below
              Center(child: Text('Calendar Content, defined elsewhere, needs to be imported and adjusted')),
            ],
          ),
        ),
      ],
    ),
  );
}

It was causing the following error:
* There's a layout issue where 'Expanded' and 'Flexible' widgets are being used without proper constraints. When using these Widgets, they must be within a Column, Row or Flex that has bounded constraints in the respective axis --> otherwise it will lead to an error such as "RenderFlex children have non-zero flex but incoming height constraints are unbounded."
* The fix was to remove the 'Expanded' wideget from the 'buildTabSection' method as there is no need for it bec
 */

  Widget buildObjectivesContent() {
    // Since this content is scrollable, it doesn't need to be in an Expanded widget
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTermGoalsAndObjectives(),
          ...List.generate(
            6,
            (index) =>
                buildWeeklyObjectiveItem(index + 1, weekDateRanges[index]),
          ),
        ],
      ),
    );
  }

  Widget buildTermGoalsAndObjectives() {
    // Increase vertical padding inside the card.
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                16.0), //needs to match the horizontal padding of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Term goal
            const Text(
              'Term goal',
              style: TextStyle(
                color: Color(0xFF1E1F1F),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // Goal content
            Container(
              width: 328,
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 16), // Increased vertical padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFE6EBEB)),
              ),
              child: const Text(
                'Be able to add numbers',
                style: TextStyle(
                  color: Color(0xFF1E1F1F),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Weekly objectives title
            const Text(
              'Weekly objectives',
              style: TextStyle(
                color: Color(0xFF1E1F1F),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Click below to view past objectives for each week',
              style: TextStyle(
                color: Color(0xFF1E1F1F),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            // List of weekly objectives
            ...List.generate(
                6,
                (index) => buildWeeklyObjectiveItem(
                    index + 1,
                    weekDateRanges[
                        index])), //widget buildWeeklyObjectiveItem has been defined below
          ],
        ));
  }

  Widget buildWeeklyObjectiveItem(int weekNumber, String weekDateRang) {
    return Container(
      width: 328,
      height: 56,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFE6EBEB)),
      ),
      // Modify the container to use the dateRange parameter.
      // ... existing code for weekly objectives items ...
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'WEEK $weekNumber',
            style: TextStyle(
              color: Color(0xFF0E1E6D),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'JUL 10 - JUL 16, 2022', // Replace with actual date range
            style: TextStyle(
              color: Color(0xFF1E1F1F),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(Icons.chevron_right, color: Color(0xFF1E1F1F)),
        ],
      ),
    );
  }
}

/* --> this was defined twice mistakenly
  Widget buildTabSection() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Color(0xFF0E1E6D),
            labelColor: Color(0xFF1E1F1F),
            tabs: [
              Tab(text: 'Objectives'),
              Tab(text: 'Calendar'),
            ],
          ),
          SizedBox(
            height: 200, // Adjust the height as necessary
            child: TabBarView(
              children: [
                Center(child: Text('Objective Content')),
                Center(child: Text('Calendar Content')),
              ],
            ),
          ),
        ],
      ),
    );
  } */

class ButtonContainer extends StatelessWidget {
  //this is the exit button to allow user to navigate back to the previous page
  final VoidCallback onPressed;

  const ButtonContainer({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: 0.80,
        child: Container(
          width: 68,
          height: 32,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: ShapeDecoration(
            color: Color(0xFFEAEDFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exit',
                style: TextStyle(
                  color: Color(0xFF0E1E6D),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.close, color: Color(0xFF0E1E6D), size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
