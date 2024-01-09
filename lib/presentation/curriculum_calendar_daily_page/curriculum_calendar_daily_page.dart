import 'bloc/curriculum_calendar_daily_bloc.dart';
import 'models/curriculum_calendar_daily_model.dart';
import 'package:somasawa_app/core/app_export.dart';
import 'package:somasawa_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CurriculumCalendarDailyPage extends StatefulWidget {
  const CurriculumCalendarDailyPage({Key? key}) : super(key: key);

  @override
  CurriculumCalendarDailyPageState createState() =>
      CurriculumCalendarDailyPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<CurriculumCalendarDailyBloc>(
        create: (context) => CurriculumCalendarDailyBloc(
            CurriculumCalendarDailyState(
                curriculumCalendarDailyModelObj:
                CurriculumCalendarDailyModel()))
          ..add(CurriculumCalendarDailyInitialEvent()),
        child: const CurriculumCalendarDailyPage());
  }
}

class CurriculumCalendarDailyPageState
    extends State<CurriculumCalendarDailyPage>
    with AutomaticKeepAliveClientMixin<CurriculumCalendarDailyPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurriculumCalendarDailyBloc,
        CurriculumCalendarDailyState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: SizeUtils.width,
                  child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(height: 15.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: Column(children: [
                              _buildSegmentedButton(context),
                              SizedBox(height: 42.v),
                              _buildListsDailyAgenda(context),
                              SizedBox(height: 43.v),
                              _buildListsDailyAgenda1(context),
                              SizedBox(height: 32.v),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 133.h),
                                  child: Column(children: [
                                    SizedBox(
                                        height: 32.adaptSize,
                                        width: 32.adaptSize,
                                        child: CircularProgressIndicator(
                                            value: 0.5,
                                            backgroundColor: appTheme.gray200)),
                                    SizedBox(height: 14.v),
                                    Text("lbl_loading".tr,
                                        style: CustomTextStyles.bodyMediumGray900)
                                  ]))
                            ]))
                      ])))));
    });
  }

  /// Section Widget
  Widget _buildSegmentedButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1.h),
        decoration: AppDecoration.outlineGray2003
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    onTapTxtLabel(context);
                  },
                  child: Padding(
                      padding:
                      EdgeInsets.only(left: 28.h, top: 14.v, bottom: 12.v),
                      child: Text("lbl_monthly".tr,
                          style: theme.textTheme.titleSmall))),
              Spacer(flex: 65),
              Padding(
                  padding: EdgeInsets.only(top: 14.v, bottom: 12.v),
                  child:
                  Text("lbl_weekly".tr, style: theme.textTheme.titleSmall)),
              Spacer(flex: 34),
              CustomElevatedButton(width: 108.h, text: "lbl_daily".tr)
            ]));
  }

  /// Section Widget
  Widget _buildFiftyThree(BuildContext context) {
    return Column(children: [
      _buildThursday(context,
          dAY: "lbl_thu".tr,
          date: "lbl_13".tr,
          attendanceRecord: "lbl_18_20".tr,
          studentsattended: "msg_students_attended".tr,
          readingAFirstPerson: "msg_reading_a_first_person".tr,
          and: "lbl_and".tr,
          three: "lbl_3".tr,
          moreObjectives: "msg_more_objectives".tr),
      SizedBox(height: 16.v),
      _buildWednesday(context,
          dAY: "lbl_wed".tr,
          date: "lbl_12".tr,
          attendanceRecord: "lbl_19_20".tr,
          studentsattended: "msg_students_attended".tr,
          readingAFirstPerson: "msg_learners_should".tr,
          and: "lbl_and".tr,
          three: "lbl_2".tr,
          moreObjectives: "msg_more_objectives".tr),
      SizedBox(height: 16.v),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 2.v, bottom: 99.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_tue".tr.toUpperCase(),
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Text("lbl_112".tr,
                              style: theme.textTheme.titleMedium))
                    ])),
            Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: _buildDailyAgendaPreview(context,
                    attendanceRecord: "lbl_20_20".tr,
                    studentsattended: "msg_students_attended".tr,
                    readingAFirstPerson: "msg_read_a_short_story".tr,
                    and: "lbl_and".tr,
                    three: "lbl_1".tr,
                    moreObjectives: "msg_more_objectives".tr))
          ]),
      SizedBox(height: 16.v),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 2.v, bottom: 99.v),
                child: Column(children: [
                  Text("lbl_mon".tr.toUpperCase(),
                      style: theme.textTheme.labelLarge),
                  SizedBox(height: 8.v),
                  Text("lbl_10".tr, style: theme.textTheme.titleMedium)
                ])),
            Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: _buildDailyAgendaPreview(context,
                    attendanceRecord: "lbl_18_20".tr,
                    studentsattended: "msg_students_attended".tr,
                    readingAFirstPerson: "msg_reading_a_first_person".tr,
                    and: "lbl_and".tr,
                    three: "lbl_1".tr,
                    moreObjectives: "msg_more_objectives".tr))
          ])
    ]);
  }

  /// Section Widget
  Widget _buildListsDailyAgenda(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 36.h),
          child: Row(children: [
            Text("lbl_july_10_16".tr.toUpperCase(),
                style: CustomTextStyles.labelLargeGray900),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("lbl_week_3".tr.toUpperCase(),
                    style: CustomTextStyles.labelLargeIndigo900))
          ])),
      SizedBox(height: 26.v),
      _buildFiftyThree(context)
    ]);
  }

  /// Section Widget
  Widget _buildListsDailyAgenda1(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 35.h),
              child: Row(children: [
                Text("lbl_july_3_9".tr.toUpperCase(),
                    style: CustomTextStyles.labelLargeGray900),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text("lbl_week_2".tr.toUpperCase(),
                        style: CustomTextStyles.labelLargeIndigo900))
              ]))),
      SizedBox(height: 26.v),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 2.v, bottom: 99.v),
                child: Column(children: [
                  Text("lbl_fri".tr.toUpperCase(),
                      style: theme.textTheme.labelLarge),
                  SizedBox(height: 8.v),
                  Text("lbl_8".tr, style: theme.textTheme.titleMedium)
                ])),
            Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: _buildDailyAgendaPreview(context,
                    attendanceRecord: "lbl_19_20".tr,
                    studentsattended: "msg_students_attended".tr,
                    readingAFirstPerson: "msg_reading_a_first_person".tr,
                    and: "lbl_and".tr,
                    three: "lbl_1".tr,
                    moreObjectives: "msg_more_objectives".tr))
          ]),
      SizedBox(height: 16.v),
      _buildThursday(context,
          dAY: "lbl_thu".tr,
          date: "lbl_7".tr,
          attendanceRecord: "lbl_18_20".tr,
          studentsattended: "msg_students_attended".tr,
          readingAFirstPerson: "msg_reading_a_first_person".tr,
          and: "lbl_and".tr,
          three: "lbl_3".tr,
          moreObjectives: "msg_more_objectives".tr),
      SizedBox(height: 16.v),
      _buildWednesday(context,
          dAY: "lbl_wed".tr,
          date: "lbl_6".tr,
          attendanceRecord: "lbl_19_20".tr,
          studentsattended: "msg_students_attended".tr,
          readingAFirstPerson: "msg_learners_should".tr,
          and: "lbl_and".tr,
          three: "lbl_2".tr,
          moreObjectives: "msg_more_objectives".tr)
    ]);
  }

  /// Common widget
  Widget _buildDailyAgendaPreview(
      BuildContext context, {
        required String attendanceRecord,
        required String studentsattended,
        required String readingAFirstPerson,
        required String and,
        required String three,
        required String moreObjectives,
      }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
        decoration: AppDecoration.outlineGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 262.h,
                  margin: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    Text(attendanceRecord,
                        style: CustomTextStyles.titleSmallGray900
                            .copyWith(color: appTheme.gray900)),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(studentsattended,
                            style: CustomTextStyles.bodyMediumGray900
                                .copyWith(color: appTheme.gray900))),
                    Spacer(),
                    CustomImageView(
                        imagePath: ImageConstant.imgNewIconUnfilled,
                        height: 20.adaptSize,
                        width: 20.adaptSize)
                  ])),
              SizedBox(height: 17.v),
              Container(
                  width: 245.h,
                  margin: EdgeInsets.only(left: 2.h, right: 17.h),
                  child: Text(readingAFirstPerson,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: appTheme.gray900, height: 1.50))),
              SizedBox(height: 8.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(and,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: appTheme.gray700))),
                    Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(three,
                            style: CustomTextStyles.titleSmallGray700
                                .copyWith(color: appTheme.gray700))),
                    Padding(
                        padding: EdgeInsets.only(left: 4.h, top: 1.v),
                        child: Text(moreObjectives,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: appTheme.gray700)))
                  ]))
            ]));
  }

  /// Common widget
  Widget _buildThursday(
      BuildContext context, {
        required String dAY,
        required String date,
        required String attendanceRecord,
        required String studentsattended,
        required String readingAFirstPerson,
        required String and,
        required String three,
        required String moreObjectives,
      }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 2.v, bottom: 99.v),
              child: Column(children: [
                Text(dAY,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: appTheme.indigo600)),
                SizedBox(height: 8.v),
                Text(date,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: appTheme.gray900))
              ])),
          Container(
              margin: EdgeInsets.only(left: 9.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
              decoration: AppDecoration.outlineGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 262.h,
                        margin: EdgeInsets.only(left: 2.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(attendanceRecord,
                                  style: CustomTextStyles.titleSmallGray900
                                      .copyWith(color: appTheme.gray900)),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.h),
                                  child: Text(studentsattended,
                                      style: CustomTextStyles.bodyMediumGray900
                                          .copyWith(color: appTheme.gray900))),
                              Spacer(),
                              CustomImageView(
                                  imagePath: ImageConstant.imgNewIconUnfilled,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)
                            ])),
                    SizedBox(height: 17.v),
                    Container(
                        width: 255.h,
                        margin: EdgeInsets.only(left: 2.h, right: 7.h),
                        child: Text(readingAFirstPerson,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: appTheme.gray900, height: 1.50))),
                    SizedBox(height: 8.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Row(children: [
                              Text(and,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: appTheme.gray700)),
                              Padding(
                                  padding: EdgeInsets.only(left: 6.h),
                                  child: Text(three,
                                      style: CustomTextStyles.titleSmallGray700
                                          .copyWith(color: appTheme.gray700))),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(moreObjectives,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(color: appTheme.gray700)))
                            ])))
                  ]))
        ]);
  }

  /// Common widget
  Widget _buildWednesday(
      BuildContext context, {
        required String dAY,
        required String date,
        required String attendanceRecord,
        required String studentsattended,
        required String readingAFirstPerson,
        required String and,
        required String three,
        required String moreObjectives,
      }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 2.v, bottom: 123.v),
              child: Column(children: [
                Text(dAY,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: appTheme.indigo600)),
                SizedBox(height: 8.v),
                Text(date,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: appTheme.gray900))
              ])),
          Container(
              margin: EdgeInsets.only(left: 9.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
              decoration: AppDecoration.outlineGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 262.h,
                        margin: EdgeInsets.only(left: 2.h),
                        child: Row(children: [
                          Text(attendanceRecord,
                              style: CustomTextStyles.titleSmallGray900
                                  .copyWith(color: appTheme.gray900)),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(studentsattended,
                                  style: CustomTextStyles.bodyMediumGray900
                                      .copyWith(color: appTheme.gray900))),
                          Spacer(),
                          CustomImageView(
                              imagePath: ImageConstant.imgNewIconUnfilled,
                              height: 20.adaptSize,
                              width: 20.adaptSize)
                        ])),
                    SizedBox(height: 17.v),
                    Container(
                        width: 245.h,
                        margin: EdgeInsets.only(left: 2.h, right: 17.h),
                        child: Text(readingAFirstPerson,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: appTheme.gray900, height: 1.50))),
                    SizedBox(height: 8.v),
                    Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(and,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: appTheme.gray700))),
                          Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Text(three,
                                  style: CustomTextStyles.titleSmallGray700
                                      .copyWith(color: appTheme.gray700))),
                          Padding(
                              padding: EdgeInsets.only(left: 4.h, top: 1.v),
                              child: Text(moreObjectives,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: appTheme.gray700)))
                        ]))
                  ]))
        ]);
  }

  /// Navigates to the curriculumCalendarMonthlyTabContainer1Screen when the action is triggered.
  onTapTxtLabel(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.curriculumCalendarMonthlyTabContainer1Screen,
    );
  }
}
