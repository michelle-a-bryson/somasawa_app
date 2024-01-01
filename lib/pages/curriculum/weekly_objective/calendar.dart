import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Monthly'),
            Tab(text: 'Weekly'),
            Tab(text: 'Daily'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const MonthlyView(), // Placeholder widget for monthly calendar
          const WeeklyView(),  // Placeholder widget for weekly list
          DailyView(),   // Placeholder widget for daily agenda
        ],
      ),
    );
  }
}

class MonthlyView extends StatelessWidget {
  const MonthlyView({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the number of days in the current month
    // and start the week from the correct day of the week.
    // For simplicity, we assume 30 days and start from Monday.

    // You would need to use a package like 'table_calendar' or
    // write your own logic to find the correct start of the month and
    // the number of days in the current month.

    final daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final List<int> daysInMonth = List.generate(30, (index) => index + 1);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: daysOfWeek.map((day) => Text(day)).toList(),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.5,
            // Adjust the spacing as required.
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: daysInMonth.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle date tap, maybe push a new route or update the state
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  '${daysInMonth[index]}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ),
        // Add any other elements or logic for displaying
        // the events below each date as shown in the screenshot.
      ],
    );
  }
}

class WeeklyView extends StatelessWidget {
  const WeeklyView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - you would retrieve this from your database or API, for now using hardcoded placeholder
    final List<Map<String, dynamic>> weeklyData = [
      {
        "date": "July 11, Tuesday",
        "attendance": "19/20 Students attended",
        "activities": [
          {"title": "Reading a first-person narrative with 2 paragraphs.", "done": true},
          {"title": "Read a short story from the story booklet.", "done": true},
          // Add more activities as needed
        ],
      },
      // Repeat for other days of the week
    ];

    return ListView.builder(
      itemCount: weeklyData.length,
      itemBuilder: (BuildContext context, int index) {
        final dayData = weeklyData[index];

        return Card(
          child: ExpansionTile(
            title: Text(dayData["date"]),
            subtitle: Text(dayData["attendance"]),
            children: dayData["activities"].map<Widget>((activity) {
              return ListTile(
                title: Text(activity["title"]),
                trailing: Icon(
                  activity["done"] ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: activity["done"] ? Colors.green : null,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class DailyView extends StatefulWidget {
  const DailyView({Key? key}) : super(key: key);

  @override
  _DailyViewState createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  final List<Map<String, dynamic>> _dailyData = [];
  final int _dataBatchSize = 10; // Number of records to load at once
  bool _hasMoreData = true; // Flag to indicate if there are more records to load

  @override
  void initState() {
    super.initState();
    _loadMoreData(); // Load initial data
  }

  void _loadMoreData() {
    // Mock function to simulate loading data
    if (_dailyData.length >= 50) { // Simulate end of data
      setState(() {
        _hasMoreData = false;
      });
      return;
    }

    // Simulate a delay in loading data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _dailyData.addAll(List.generate(_dataBatchSize, (index) => {
          "date": "Example Date",
          "attendance": "X/Y Students attended",
          "activities": [
            {"title": "Activity ${_dailyData.length + index + 1}", "done": index % 2 == 0},
            // Add more activities based on index
          ]
        }));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (_hasMoreData && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          _loadMoreData(); // Load more data when scrolled to the bottom
        }
        return true;
      },
      child: ListView.builder(
        itemCount: _hasMoreData ? _dailyData.length + 1 : _dailyData.length,
        itemBuilder: (context, index) {
          if (index == _dailyData.length) {
            // Display loading indicator at the end of the list
            return Center(child: CircularProgressIndicator());
          }
          final dayData = _dailyData[index];

          return Card(
            child: ExpansionTile(
              title: Text(dayData["date"]),
              subtitle: Text(dayData["attendance"]),
              children: dayData["activities"].map<Widget>((activity) {
                return ListTile(
                  title: Text(activity["title"]),
                  trailing: Icon(
                    activity["done"] ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: activity["done"] ? Colors.green : null,
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}


