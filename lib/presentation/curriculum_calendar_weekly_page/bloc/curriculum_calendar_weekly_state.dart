// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_bloc.dart';

/// Represents the state of CurriculumCalendarWeekly in the application.
class CurriculumCalendarWeeklyState extends Equatable {
  CurriculumCalendarWeeklyState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarWeeklyModelObj,
  });

  CurriculumCalendarWeeklyModel? curriculumCalendarWeeklyModelObj;

  DateTime? rangeStart;

  DateTime? rangeEnd;

  DateTime? selectedDay;

  DateTime? focusedDay;

  RangeSelectionMode rangeSelectionMode;

  @override
  List<Object?> get props => [
    rangeStart,
    rangeEnd,
    selectedDay,
    focusedDay,
    rangeSelectionMode,
    curriculumCalendarWeeklyModelObj,
  ];
  CurriculumCalendarWeeklyState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarWeeklyModel? curriculumCalendarWeeklyModelObj,
  }) {
    return CurriculumCalendarWeeklyState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarWeeklyModelObj: curriculumCalendarWeeklyModelObj ??
          this.curriculumCalendarWeeklyModelObj,
    );
  }
}
