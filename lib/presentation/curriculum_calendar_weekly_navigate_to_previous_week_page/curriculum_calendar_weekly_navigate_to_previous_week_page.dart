import 'bloc/curriculum_calendar_weekly_navigate_to_previous_week_bloc.dart';
import 'models/curriculum_calendar_weekly_navigate_to_previous_week_model.dart';
import 'package:somasawa_app/core/app_export.dart';
import 'package:somasawa_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CurriculumCalendarWeeklyNavigateToPreviousWeekPage
    extends StatefulWidget {
  const CurriculumCalendarWeeklyNavigateToPreviousWeekPage({Key? key})
      : super(key: key);

  @override
  CurriculumCalendarWeeklyNavigateToPreviousWeekPageState createState() =>
      CurriculumCalendarWeeklyNavigateToPreviousWeekPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<CurriculumCalendarWeeklyNavigateToPreviousWeekBloc>(
        create: (context) => CurriculumCalendarWeeklyNavigateToPreviousWeekBloc(
            CurriculumCalendarWeeklyNavigateToPreviousWeekState(
                curriculumCalendarWeeklyNavigateToPreviousWeekModelObj:
                CurriculumCalendarWeeklyNavigateToPreviousWeekModel()))
          ..add(CurriculumCalendarWeeklyNavigateToPreviousWeekInitialEvent()),
        child: CurriculumCalendarWeeklyNavigateToPreviousWeekPage());
  }
}

class CurriculumCalendarWeeklyNavigateToPreviousWeekPageState
    extends State<CurriculumCalendarWeeklyNavigateToPreviousWeekPage>
    with
        AutomaticKeepAliveClientMixin<
            CurriculumCalendarWeeklyNavigateToPreviousWeekPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Column(children: [
                  SizedBox(height: 15.v),
                  _buildEightySeven(context)
                ]))));
  }

  /// Section Widget
  Widget _buildEightySeven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(children: [
          Container(
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
                    padding:
                    EdgeInsets.only(top: 14.v, right: 10.h, bottom: 12.v),
                    child:
                    Text("lbl_daily".tr, style: theme.textTheme.titleSmall))
              ])),
          SizedBox(height: 16.v),
          BlocBuilder<CurriculumCalendarWeeklyNavigateToPreviousWeekBloc,
              CurriculumCalendarWeeklyNavigateToPreviousWeekState>(
              builder: (context, state) {
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
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
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
              }),
          SizedBox(height: 45.v),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_july_9_sunday".tr, style: theme.textTheme.titleLarge),
            SizedBox(height: 18.v),
            Container(
                padding: EdgeInsets.symmetric(vertical: 1.v),
                decoration: AppDecoration.outlineGray2002,
                child:
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15.v, bottom: 1.v),
                      child: Text("lbl_no_class_on".tr,
                          style: CustomTextStyles.titleMediumMedium)),
                  Padding(
                      padding: EdgeInsets.only(left: 4.h, top: 15.v),
                      child: Text("lbl_july_9_sunday".tr,
                          style: theme.textTheme.titleMedium))
                ]))
          ])
        ]));
  }

  /// Navigates to the curriculumCalendarMonthlyTabContainer1Screen when the action is triggered.
  onTapTxtLabel(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.curriculumCalendarMonthlyTabContainer1Screen,
    );
  }
}
