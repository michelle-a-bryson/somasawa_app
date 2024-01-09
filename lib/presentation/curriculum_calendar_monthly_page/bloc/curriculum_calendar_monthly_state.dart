// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_bloc.dart';

/// Represents the state of CurriculumCalendarMonthly in the application.
class CurriculumCalendarMonthlyState extends Equatable {
  CurriculumCalendarMonthlyState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarMonthlyModelObj,
  });

  CurriculumCalendarMonthlyModel? curriculumCalendarMonthlyModelObj;

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
    curriculumCalendarMonthlyModelObj,
  ];
  CurriculumCalendarMonthlyState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarMonthlyModel? curriculumCalendarMonthlyModelObj,
  }) {
    return CurriculumCalendarMonthlyState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarMonthlyModelObj: curriculumCalendarMonthlyModelObj ??
          this.curriculumCalendarMonthlyModelObj,
    );
  }
}

