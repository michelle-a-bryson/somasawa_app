// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_tab_container_bloc.dart';

/// Represents the state of CurriculumCalendarMonthlyTabContainer in the application.
class CurriculumCalendarMonthlyTabContainerState extends Equatable {
  CurriculumCalendarMonthlyTabContainerState(
      {this.curriculumCalendarMonthlyTabContainerModelObj});

  CurriculumCalendarMonthlyTabContainerModel?
  curriculumCalendarMonthlyTabContainerModelObj;

  @override
  List<Object?> get props => [
    curriculumCalendarMonthlyTabContainerModelObj,
  ];
  CurriculumCalendarMonthlyTabContainerState copyWith(
      {CurriculumCalendarMonthlyTabContainerModel?
      curriculumCalendarMonthlyTabContainerModelObj}) {
    return CurriculumCalendarMonthlyTabContainerState(
      curriculumCalendarMonthlyTabContainerModelObj:
      curriculumCalendarMonthlyTabContainerModelObj ??
          this.curriculumCalendarMonthlyTabContainerModelObj,
    );
  }
}
