import 'dart:developer';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:somasawa_app/styles/colors.dart';
import 'package:somasawa_app/styles/texts.dart';

import 'add_activity.dart';

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
                IconButton(
                  onPressed: () {
                    log("More button pressed");
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return ModalWidget(
                            context,
                            title: "Group #12",
                            childrenWidgets: [
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Edit group",
                                style: paragraphMediumRegular400,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "Delete group",
                                style: paragraphMediumRegular400.copyWith(
                                    color: error500),
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: primary500,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 28, 0),
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
                SingleAgenda(context),
                SingleAgenda(context),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          log("Add a new activity button pressed");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddActivity()));
                        },
                        style: ElevatedButton.styleFrom(
                          // foregroundColor: Colors.white,
                          backgroundColor: Colors
                              .white, //changed from primary, secondary --> foreground, background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), //Rounds the corners of the buttons.
                          ),
                          // margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                          padding: EdgeInsets.all(
                              16), //sets the padding inside the button
                        ),
                        child: Center(
                            child: Text(
                          "+ Add a new activity",
                          style: paragraphMediumMedium500.copyWith(
                              color: primary500),
                        ))))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container ModalWidget(BuildContext context,
      {String title = "", List<Widget> childrenWidgets = const []}) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 32, 32, 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              title,
              style: headingH6Medium500.copyWith(color: neutralBlack),
            ),
          ),
          ...childrenWidgets
        ],
      ),
    );
  }

  Container SingleAgenda(BuildContext context) {
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
            IconButton(
              onPressed: () {
                log("More button pressed");
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return ModalWidget(
                        context,
                        title: "Students take turns reading...",
                        childrenWidgets: [
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Edit the activity",
                            style: paragraphMediumRegular400,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Delete the activity",
                            style: paragraphMediumRegular400.copyWith(
                                color: error500),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.more_horiz,
                color: primary500,
              ),
            )
          ],
        ));
  }
}
