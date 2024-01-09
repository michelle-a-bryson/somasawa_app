import 'package:flutter/material.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

class GroupActivities extends StatelessWidget {
  const GroupActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: neutral100),
      ),
      child: Column(
        children: [
          Container(
            height: 56,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
                color: primary100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              children: [
                Text(
                  "Group #1",
                  style: paragraphLargeBold700.copyWith(color: primary500),
                ),
                Spacer(),
                Icon(
                  Icons.group,
                  color: primary500,
                ),
                Text("7 students",
                    style:
                        paragraphSmallRegular400.copyWith(color: primary500)),
                Container(
                  width: 20,
                ),
                Icon(
                  Icons.more_horiz,
                  color: primary500,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            // height: 56,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.flag,
                      color: error600,
                    ),
                    Expanded(
                      child: Text(
                        "Reading the first person narrative with 2 paragraphs paragraphs paragraphsparagraphsparagraphs",
                        style: paragraphMediumMedium500.copyWith(
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    // Spacer(
                    //   flex: 0,
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors
                              .blue, // replace with your desired border color
                          width: 2.0, // replace with your desired border width
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text("2/2"),
                      ),
                    ),
                  ],
                ),
                SingleAgenda(),
                SingleAgenda(),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: primary500),
                    ),
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "+ Add daily activity",
                      style:
                          paragraphMediumMedium500.copyWith(color: primary500),
                    ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container SingleAgenda() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: neutral200)),
        child: Row(
          children: [
            //checkbox
            Checkbox(
                value: false,
                onChanged: (value) {
                  print(value);
                }),

            Text("Add to agenda"),
            Spacer(),
            Icon(Icons.more_horiz)
          ],
        ));
  }
}
