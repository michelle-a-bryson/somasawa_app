import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'class_model.dart';

class ClassListing extends StatelessWidget {
  final List<ClassModel> currentClasses = [
    ClassModel(title: 'TERM 2, 2023 - LITERACY (AM)', term: 'Paragraph'),
    ClassModel(title: 'TERM 2, 2023 - MATH (PM)', term: 'Addition'),
  ];

  final List<ClassModel> pastClasses = [
    ClassModel(title: 'TERM 1, 2022 - LITERACY (PM)', term: 'Paragraph', isArchived: true),
    ClassModel(title: 'TERM 2, 2022 - MATH (PM)', term: 'Addition', isArchived: true),
  ];

  ClassListing({Key? key}) : super(key: key);
  //widget that will handle the styling for the card
  Widget _buildClassCard(BuildContext context, ClassModel classModel, bool isArchived, {bool isFirst = false}) {
    Color iconColor = isFirst ? Colors.blue.shade600 : Color(0xFF65696B);
    Color borderColor = isFirst ? Colors.blue.shade600 : Color(0xFFE6EBEB);
    double borderWidth = isFirst ? 2 : 1;
    Color backgroundColor = Color(0xFFEAEDFA); // This sets the background color for both icons

    return Container(
      width: 328,
      height: 80,  //initially set to 97 to resolve pixel overflow, but then changed it back and changed font size from 14 --> 13.5
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor, // Use the same background color for consistency
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                isFirst ? Icons.check_circle : Symbols.swap_horiz,
                size: 24,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classModel.title,
                    style: TextStyle(
                      color: Color(0xFF0E1E6D),
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    classModel.term,
                    style: TextStyle(
                      color: Color(0xFF65696B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (!isArchived) Icon(Icons.chevron_right, color: Color(0xFF65696B)),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Classes',
        style: TextStyle(color: Colors.white), // Set the text color to white
      ),
      //backgroundColor: Colors.dark_blue, // Set the AppBar background color if needed
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white), // Add the back arrow icon
        onPressed: () {
          Navigator.of(context).pop(); // Use Navigator.pop() to return to the previous screen
        },
      ),
    ),

  body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.40,
                    child: Container(
                      width: 32,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFF65696B),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Current Classes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E1F1F),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ...currentClasses.map((classItem) => _buildClassCard(
              context,
              classItem,
              false,
              isFirst: currentClasses.indexOf(classItem) == 0,
            )),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    'Past Classes',
                    style: TextStyle(
                      color: Color(0xFF1E1F1F),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0), // Add padding to give space between the text and the next element
                    child: Text(
                      'VIEW ONLY',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ...pastClasses.map((classItem) => _buildClassCard(context, classItem, true)),
          ],
        ),
      ),
    );
  }
}



