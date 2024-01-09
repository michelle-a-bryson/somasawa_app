import 'package:flutter/material.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_tab_container1_screen/curriculum_calendar_monthly_tab_container1_screen.dart';
import 'package:somasawa_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String curriculumCalendarMonthlyPage =
      '/curriculum_calendar_monthly_page';

  static const String curriculumCalendarMonthlyTabContainerPage =
      '/curriculum_calendar_monthly_tab_container_page';

  static const String curriculumCalendarMonthlyTabContainer1Screen =
      '/curriculum_calendar_monthly_tab_container1_screen';

  static const String curriculumCalendarWeeklyAbsentClassPage =
      '/curriculum_calendar_weekly_absent_class_page';

  static const String curriculumCalendarDailyPage =
      '/curriculum_calendar_daily_page';

  static const String curriculumCalendarWeeklyPage =
      '/curriculum_calendar_weekly_page';

  static const String curriculumCalendarWeeklyNavigateToPreviousWeekPage =
      '/curriculum_calendar_weekly_navigate_to_previous_week_page';

  static const String curriculumCalendarWeeklyNoClassPage =
      '/curriculum_calendar_weekly_no_class_page';

  static const String curriculumCalendarWeeklyNoDailyAgendaPage =
      '/curriculum_calendar_weekly_no_daily_agenda_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    curriculumCalendarMonthlyTabContainer1Screen:
    CurriculumCalendarMonthlyTabContainer1Screen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: CurriculumCalendarMonthlyTabContainer1Screen.builder
  };
}



//this will require changing as it's not the initial route

