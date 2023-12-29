import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somasawa_app/pages/curriculum/set_up_class.dart';
import 'package:somasawa_app/styles/colors.dart';

//this is the main curriculum page

//The curriculum page is a stateless widget which will build the UI for the curriculum screen
class CurriculumPage extends StatelessWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //had an error stating the constructor being called isn't a "Const" constructor
      appBar: AppBar(
        title: const Text(
          'Curriculum',
          style: TextStyle(color: Colors.white),
        ), //sets the title of the appbar
        backgroundColor: primary500, //sets the background color of the appbar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //stretches the column to git the screen width
        children: <Widget>[
          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              "assets/no_class_curriculum.svg",
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            //needed the const modifier added
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'No Class', //Text indicating that no class has been set up
                  style: TextStyle(
                    fontWeight: FontWeight.bold, //sets the fontWeight to bold.
                    fontSize: 24, //specifies the font size
                  ),
                ),
                const SizedBox(
                    height:
                        8), //removed unnecessary keyword const from SizedBox
                const Text(
                  //also removed unnecessary keyword const from Text
                  'Please set up a new class in our learning app to start.', //Instructional text
                  textAlign: TextAlign.center, //centers the text
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SetUpClass(),
                      ),
                    );
                  }, //text that gets displayed inside the button,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        primary500, //changed from primary, secondary --> foreground, background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), //Rounds the corners of the buttons.
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16), //sets the padding inside the button
                  ),
                  child: const Text('Set up new class'),
                ),
              ],
            ),
          )
        ], // ,
      ),
    );
  }
}
