// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_daily_bloc.dart';

/// Represents the state of CurriculumCalendarDaily in the application.
class CurriculumCalendarDailyState extends Equatable {
  CurriculumCalendarDailyState({this.curriculumCalendarDailyModelObj});

  CurriculumCalendarDailyModel? curriculumCalendarDailyModelObj;

  @override
  List<Object?> get props => [
    curriculumCalendarDailyModelObj,
  ];
  CurriculumCalendarDailyState copyWith(
      {CurriculumCalendarDailyModel? curriculumCalendarDailyModelObj}) {
    return CurriculumCalendarDailyState(
      curriculumCalendarDailyModelObj: curriculumCalendarDailyModelObj ??
          this.curriculumCalendarDailyModelObj,
    );
  }
}
