// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_tab_container1_bloc.dart';

/// Represents the state of CurriculumCalendarMonthlyTabContainer1 in the application.
class CurriculumCalendarMonthlyTabContainer1State extends Equatable {
  CurriculumCalendarMonthlyTabContainer1State(
      {this.curriculumCalendarMonthlyTabContainer1ModelObj});

  CurriculumCalendarMonthlyTabContainer1Model?
  curriculumCalendarMonthlyTabContainer1ModelObj;

  @override
  List<Object?> get props => [
    curriculumCalendarMonthlyTabContainer1ModelObj,
  ];
  CurriculumCalendarMonthlyTabContainer1State copyWith(
      {CurriculumCalendarMonthlyTabContainer1Model?
      curriculumCalendarMonthlyTabContainer1ModelObj}) {
    return CurriculumCalendarMonthlyTabContainer1State(
      curriculumCalendarMonthlyTabContainer1ModelObj:
      curriculumCalendarMonthlyTabContainer1ModelObj ??
          this.curriculumCalendarMonthlyTabContainer1ModelObj,
    );
  }
}


