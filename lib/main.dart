import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

//import for home directory
import 'package:somasawa_app/pages/home/home_page.dart';
//import for agenda directory
import 'package:somasawa_app/pages/agenda/agenda_page.dart';
import 'package:somasawa_app/pages/curriculum/curriculum_page.dart'; //import the curriculum_page here so it can be used
import 'package:somasawa_app/pages/student/student_page.dart';
//import 'package:somasawa_app/pages/curriculum/weekly_objective/calendar/calendar.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:material_symbols_icons/symbols.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.light(
          primary: neutralBlack,
          onPrimary: primary500,
          // secondary: neutralBlack,
          // onSecondary: primary500,
          error: error500,
          onError: error100,
          background: neutral100,
          onBackground: neutralBlack,
          surface: primary500,
          onSurface: neutralBlack,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  final pages = const <Widget>[
    HomePage(),
    AgendaPage(),
    CurriculumPage(),
    StudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: primary500,
          backgroundColor: neutralWhite,
          height: 64,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Symbols.home_rounded, fill: 1),
              icon: Icon(Symbols.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Symbols.list_alt_rounded, fill: 1),
              icon: Icon(Symbols.list_alt_rounded),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Symbols.book_5_rounded, fill: 1),
              icon: Icon(Symbols.book_5_rounded),
              label: 'Curriculum',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Symbols.face_rounded, fill: 1),
              icon: Icon(Symbols.face_rounded),
              label: 'Student',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(child: pages[index]);
            },
          );
        });
    // appBar: AppBar(
    //   // TRY THIS: Try changing the color here to a specific color (to
    //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
    //   // change color while the other colors stay the same.
    //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //   // Here we take the value from the MyHomePage object that was created by
    //   // the App.build method, and use it to set our appbar title.
    //   title: Text(widget.title),
    // ),
    //   body: PageView(
    //     controller: _pageController,
    //     children: const <Widget>[
    //       HomePage(),
    //       AgendaPage(),
    //       CurriculumPage(),
    //       StudentPage(),
    //     ],
    //   ),
    //   bottomNavigationBar: NavigationBar(
    //     onDestinationSelected: (int index) {
    //       _pageController.animateToPage(
    //         index,
    //         duration: const Duration(milliseconds: 400),
    //         curve: Curves.easeOut,
    //       );
    //       setState(() {
    //         currentPageIndex = index;
    //       });
    //     },
    //     indicatorColor: const Color(0xFF36CED9),
    //     backgroundColor: neutralWhite,
    //     selectedIndex: currentPageIndex,
    //     destinations: const <Widget>[
    //       NavigationDestination(
    //         selectedIcon: Icon(Symbols.home_rounded, fill: 1),
    //         icon: Icon(Symbols.home_rounded),
    //         label: 'Home',
    //       ),
    //       NavigationDestination(
    //         selectedIcon: Icon(Symbols.list_alt_rounded, fill: 1),
    //         icon: Icon(Symbols.list_alt_rounded),
    //         label: 'Agenda',
    //       ),
    //       NavigationDestination(
    //         selectedIcon: Icon(Symbols.book_5_rounded, fill: 1),
    //         icon: Icon(Symbols.book_5_rounded),
    //         label: 'Curriculum',
    //       ),
    //       NavigationDestination(
    //         selectedIcon: Icon(Symbols.face_rounded, fill: 1),
    //         icon: Icon(Symbols.face_rounded),
    //         label: 'Student',
    //       ),
    //     ],
    //   ),
    // );
  }
}
