import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somasawa_app/pages/curriculum/set_up_class/set_up_class.dart';
import 'package:somasawa_app/pages/curriculum/weekly_objective/weekly_objective_view.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class SuccessSetup extends StatelessWidget {
  const SuccessSetup({super.key});

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
              "assets/completed_setup.svg",
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
            child: Expanded(
              //needed the const modifier added
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Class is all set', //Text indicating that no class has been set up
                    style: headingH4Bold700,
                  ),
                  const SizedBox(
                      height:
                          8), //removed unnecessary keyword const from SizedBox
                  Text(
                    //also removed unnecessary keyword const from Text
                    'Literacy class for Term 2, 2023 has been created', //Instructional text
                    textAlign: TextAlign.center, //centers the text
                    style: paragraphMediumRegular400,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const WeeklyObjectiveView(),
                          ),
                          (route) => false,
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
                      child: const Text('Go to lesson plan'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
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
                      child: const Text('Set up another class'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ], // ,
      ),
    );
  }
}
