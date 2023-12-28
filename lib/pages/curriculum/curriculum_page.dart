import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';


//this is the main curriculum page

//The curriculum page is a stateless widget which will build the UI for the curriculum screen
class CurriculumPage extends StatelessWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //had an error stating the constructor being called isn't a "Const" constructor
      appBar: AppBar(
        title: const Text('Curriculum'),  //sets the title of the appbar
        backgroundColor: Colors.blue[800], //sets the background color of the appbar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  //stretches the column to git the screen width
        children: <Widget>[
          Expanded(  //will return an error until child has been added within the body
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16.0), //adds padding inside the container
              alignment: Alignment.center,
              child: const Text(
                'Curriculum / Objectives (Empty)', //placeholder text for the top part of the screen
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,  // Sets the font size of the text.
                ),
                textAlign: TextAlign.center,  //centers the text
              ),
            ) ,
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/curriculum_illustration.png',  //placeholder for illustrations path, does not exist at the moment
              fit: BoxFit.contain,  //Ensures that the image fits withing the container
            ),
          ),
          Expanded(  //needed the const modifier added
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'No Class',  //Text indicating that no class has been set up
                  style: TextStyle(
                    fontWeight: FontWeight.bold, //sets the fontWeight to bold.
                    fontSize: 24,  //specifies the font size
                  ),
                ),
                const SizedBox(height: 8),  //removed unnecessary keyword const from SizedBox
                const Text(  //also removed unnecessary keyword const from Text
                  'Please set up a new class in our learning app to start.', //Instructional text
                  textAlign: TextAlign.center,  //centers the text
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    //placeholder for the button action, implement the navigation or functionality here (fix later)
                  }, //text that gets displayed inside the button,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,  //changed from primary, secondary --> foreground, background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),  //Rounds the corners of the buttons.
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), //sets the padding inside the button
                  ),
                  child: const Text('Set up new class'),
                ),
              ],
            ),
          )
        ],// ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  //Home icon for the navigation bar
            label: 'Home',  //Label for the home icon
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda), //Agenda icon for the navigation bar (note: this is just a placeholder for now, agenda icon doesn't exist at the moment will require further research in this regard
              label: 'Agenda',  //label for the agenda icon, displayed underneath the icon
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.blue),  //curriculum icon for the navigation bar, highlighted with color.
              label: 'Curriculum',  //Label for the curriculum icon.
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),  //student icon for the navigation bar.
              label: 'Student',  //Label for the student icon
          ),
        ],
        currentIndex: 2,  //sets the current index to the curriculum page to highlight it.
        selectedItemColor: Colors.blue[800],  //color of the selected item in the nav bar
      ),
    );
  }
}


