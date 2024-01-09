// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_no_class_bloc.dart';

/// Represents the state of CurriculumCalendarWeeklyNoClass in the application.
class CurriculumCalendarWeeklyNoClassState extends Equatable {
  CurriculumCalendarWeeklyNoClassState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarWeeklyNoClassModelObj,
  });

  CurriculumCalendarWeeklyNoClassModel? curriculumCalendarWeeklyNoClassModelObj;

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
    curriculumCalendarWeeklyNoClassModelObj,
  ];
  CurriculumCalendarWeeklyNoClassState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarWeeklyNoClassModel?
    curriculumCalendarWeeklyNoClassModelObj,
  }) {
    return CurriculumCalendarWeeklyNoClassState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarWeeklyNoClassModelObj:
      curriculumCalendarWeeklyNoClassModelObj ??
          this.curriculumCalendarWeeklyNoClassModelObj,
    );
  }
}
