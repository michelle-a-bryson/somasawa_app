// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_navigate_to_previous_week_bloc.dart';

/// Represents the state of CurriculumCalendarWeeklyNavigateToPreviousWeek in the application.
class CurriculumCalendarWeeklyNavigateToPreviousWeekState extends Equatable {
  CurriculumCalendarWeeklyNavigateToPreviousWeekState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarWeeklyNavigateToPreviousWeekModelObj,
  });

  CurriculumCalendarWeeklyNavigateToPreviousWeekModel?
  curriculumCalendarWeeklyNavigateToPreviousWeekModelObj;

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
    curriculumCalendarWeeklyNavigateToPreviousWeekModelObj,
  ];
  CurriculumCalendarWeeklyNavigateToPreviousWeekState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarWeeklyNavigateToPreviousWeekModel?
    curriculumCalendarWeeklyNavigateToPreviousWeekModelObj,
  }) {
    return CurriculumCalendarWeeklyNavigateToPreviousWeekState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarWeeklyNavigateToPreviousWeekModelObj:
      curriculumCalendarWeeklyNavigateToPreviousWeekModelObj ??
          this.curriculumCalendarWeeklyNavigateToPreviousWeekModelObj,
    );
  }
}
