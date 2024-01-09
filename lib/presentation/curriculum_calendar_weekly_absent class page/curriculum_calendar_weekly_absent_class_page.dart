import 'bloc/curriculum_calendar_weekly_absent_class_bloc.dart';
import 'models/curriculum_calendar_weekly_absent_class_model.dart';
import 'package:somasawa_app/core/app_export.dart';
import 'package:somasawa_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CurriculumCalendarWeeklyAbsentClassPage extends StatefulWidget {
  const CurriculumCalendarWeeklyAbsentClassPage({Key? key}) : super(key: key);

  @override
  CurriculumCalendarWeeklyAbsentClassPageState createState() =>
      CurriculumCalendarWeeklyAbsentClassPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<CurriculumCalendarWeeklyAbsentClassBloc>(
        create: (context) => CurriculumCalendarWeeklyAbsentClassBloc(
            CurriculumCalendarWeeklyAbsentClassState(
                curriculumCalendarWeeklyAbsentClassModelObj:
                CurriculumCalendarWeeklyAbsentClassModel()))
          ..add(CurriculumCalendarWeeklyAbsentClassInitialEvent()),
        child: CurriculumCalendarWeeklyAbsentClassPage());
  }
}

class CurriculumCalendarWeeklyAbsentClassPageState
    extends State<CurriculumCalendarWeeklyAbsentClassPage>
    with
        AutomaticKeepAliveClientMixin<CurriculumCalendarWeeklyAbsentClassPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
                            SizedBox(height: 16.v),
                            _buildDatepickerWDate(context),
                            SizedBox(height: 45.v),
                            _buildCardDailyAgenda(context)
                          ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildSegmentedButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 1.v),
        decoration: AppDecoration.outlineGray2003
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          GestureDetector(
              onTap: () {
                onTapTxtLabel(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 14.v, bottom: 12.v),
                  child: Text("lbl_monthly".tr,
                      style: theme.textTheme.titleSmall))),
          CustomElevatedButton(
              width: 108.h,
              text: "lbl_weekly".tr,
              margin: EdgeInsets.only(left: 27.h)),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 14.v, right: 10.h, bottom: 12.v),
              child: Text("lbl_daily".tr, style: theme.textTheme.titleSmall))
        ]));
  }

  /// Section Widget
  Widget _buildDatepickerWDate(BuildContext context) {
    return BlocBuilder<CurriculumCalendarWeeklyAbsentClassBloc,
        CurriculumCalendarWeeklyAbsentClassState>(builder: (context, state) {
      return SizedBox(
          height: 160.v,
          width: 328.h,
          child: TableCalendar(
              locale: 'en_US',
              firstDay: DateTime(DateTime.now().year - 5),
              lastDay: DateTime(DateTime.now().year + 5),
              calendarFormat: CalendarFormat.month,
              rangeSelectionMode: state.rangeSelectionMode,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              headerStyle:
              HeaderStyle(formatButtonVisible: false, titleCentered: true),
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: false, isTodayHighlighted: true),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: appTheme.gray900,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400)),
              headerVisible: false,
              focusedDay: state.focusedDay ?? DateTime.now(),
              rangeStartDay: state.rangeStart,
              rangeEndDay: state.rangeEnd,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(state.selectedDay, selectedDay)) {
                  state.focusedDay = focusedDay;
                  state.selectedDay = selectedDay;
                  state.rangeSelectionMode = RangeSelectionMode.toggledOn;
                }
              },
              onRangeSelected: (start, end, focusedDay) {
                state.focusedDay = focusedDay;
                state.rangeEnd = end;
                state.rangeStart = start;
                state.rangeSelectionMode = RangeSelectionMode.toggledOn;
              },
              onPageChanged: (focusedDay) {
                state.focusedDay = focusedDay;
              }));
    });
  }

  /// Section Widget
  Widget _buildCardDailyAgenda(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 14.h),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_july_3_monday".tr, style: theme.textTheme.titleLarge),
            CustomImageView(
                imagePath: ImageConstant.imgIconFilled,
                height: 20.adaptSize,
                width: 20.adaptSize,
                margin: EdgeInsets.only(bottom: 3.v))
          ])),
      SizedBox(height: 18.v),
      Container(
          decoration: AppDecoration.outlineGray200
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                width: 328.h,
                padding: EdgeInsets.fromLTRB(15.h, 15.v, 15.h, 16.v),
                decoration: AppDecoration.outlineIndigo,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgIconFilledIndigo600,
                            height: 20.adaptSize,
                            width: 20.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text("lbl_18_20".tr,
                                style: CustomTextStyles.titleSmallGray900)),
                        Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text("msg_students_attended".tr,
                                style: CustomTextStyles.bodyMediumGray900))
                      ]),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(right: 75.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath:
                                ImageConstant.imgNewIconUnfilledIndigo600,
                                height: 20.adaptSize,
                                width: 20.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h, top: 2.v),
                                child: Text("lbl_joyce_wood".tr,
                                    style: CustomTextStyles.titleSmallGray900)),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text("msg_covered_the_class".tr,
                                    style: CustomTextStyles.bodyMediumGray900))
                          ]))
                    ])),
            Container(
                padding: EdgeInsets.all(15.h),
                decoration: AppDecoration.outlineGray2001
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderBL12),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 8.v),
                      Text("lbl_group_1".tr,
                          style: CustomTextStyles.titleMedium18),
                      SizedBox(height: 5.v),
                      Container(
                          padding: EdgeInsets.only(top: 14.v, bottom: 15.v),
                          decoration: AppDecoration.outlineGray2002,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 1.v),
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgVector,
                                                  height: 15.v,
                                                  width: 13.h,
                                                  margin: EdgeInsets.only(
                                                      top: 3.v, bottom: 21.v)),
                                              Container(
                                                  width: 197.h,
                                                  margin: EdgeInsets.only(
                                                      left: 13.h),
                                                  child: Text(
                                                      "msg_reading_a_first_person"
                                                          .tr,
                                                      maxLines: 2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .titleSmallGray900Medium
                                                          .copyWith(
                                                          height: 1.43)))
                                            ]))),
                                Container(
                                    height: 40.adaptSize,
                                    width: 40.adaptSize,
                                    margin: EdgeInsets.only(left: 26.h),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: 40.adaptSize,
                                                  width: 40.adaptSize,
                                                  decoration: BoxDecoration(
                                                      color: appTheme.gray200,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20.h)))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                  height: 40.adaptSize,
                                                  width: 40.adaptSize,
                                                  child: Stack(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                height: 40
                                                                    .adaptSize,
                                                                width: 40
                                                                    .adaptSize,
                                                                decoration: BoxDecoration(
                                                                    color: appTheme
                                                                        .cyan400,
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        20.h)))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 9
                                                                        .h),
                                                                child: Text(
                                                                    "lbl_1_1"
                                                                        .tr,
                                                                    style: CustomTextStyles
                                                                        .bodyMediumGray900)))
                                                      ])))
                                        ]))
                              ])),
                      SizedBox(height: 24.v),
                      Text("lbl_group_2".tr,
                          style: CustomTextStyles.titleMedium18),
                      SizedBox(height: 5.v),
                      Container(
                          padding: EdgeInsets.only(top: 14.v, bottom: 15.v),
                          decoration: AppDecoration.outlineGray2002,
                          child: Row(children: [
                            CustomImageView(
                                imagePath:
                                ImageConstant.imgNewIconUnfilledRed700,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: EdgeInsets.only(bottom: 16.v)),
                            Container(
                                width: 206.h,
                                margin: EdgeInsets.only(left: 8.h),
                                child: Text("msg_read_a_short_story".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .titleSmallGray900Medium
                                        .copyWith(height: 1.43))),
                            Container(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                margin: EdgeInsets.only(left: 18.h),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                              height: 40.adaptSize,
                                              width: 40.adaptSize,
                                              child: CircularProgressIndicator(
                                                  value: 0.5,
                                                  backgroundColor:
                                                  appTheme.gray200))),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                              EdgeInsets.only(left: 9.h),
                                              child: Text("lbl_1_1".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumGray900)))
                                    ]))
                          ]))
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
