import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Expanded(
              flex: 4,
              child:
                  Text('Good Morning', style: TextStyle(color: Colors.white)),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Symbols.notifications_rounded),
                  color: Colors.white,
                )),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Symbols.person_rounded),
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ],
        ), //sets the title of the appbar
        centerTitle: true,
        backgroundColor:
            const Color(0xff0e1e6d), //sets the background color of the appbar
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Text("Term 2", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[Expanded(flex: 3, child: Text('Home Page'))]),
    );
  }
}
