// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_absent_class_bloc.dart';

/// Represents the state of CurriculumCalendarWeeklyAbsentClass in the application.
class CurriculumCalendarWeeklyAbsentClassState extends Equatable {
  CurriculumCalendarWeeklyAbsentClassState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarWeeklyAbsentClassModelObj,
  });

  CurriculumCalendarWeeklyAbsentClassModel?
  curriculumCalendarWeeklyAbsentClassModelObj;

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
    curriculumCalendarWeeklyAbsentClassModelObj,
  ];
  CurriculumCalendarWeeklyAbsentClassState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarWeeklyAbsentClassModel?
    curriculumCalendarWeeklyAbsentClassModelObj,
  }) {
    return CurriculumCalendarWeeklyAbsentClassState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarWeeklyAbsentClassModelObj:
      curriculumCalendarWeeklyAbsentClassModelObj ??
          this.curriculumCalendarWeeklyAbsentClassModelObj,
    );
  }
}
