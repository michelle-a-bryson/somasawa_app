// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_no_daily_agenda_bloc.dart';

/// Represents the state of CurriculumCalendarWeeklyNoDailyAgenda in the application.
class CurriculumCalendarWeeklyNoDailyAgendaState extends Equatable {
  CurriculumCalendarWeeklyNoDailyAgendaState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.curriculumCalendarWeeklyNoDailyAgendaModelObj,
  });

  CurriculumCalendarWeeklyNoDailyAgendaModel?
  curriculumCalendarWeeklyNoDailyAgendaModelObj;

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
    curriculumCalendarWeeklyNoDailyAgendaModelObj,
  ];
  CurriculumCalendarWeeklyNoDailyAgendaState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    CurriculumCalendarWeeklyNoDailyAgendaModel?
    curriculumCalendarWeeklyNoDailyAgendaModelObj,
  }) {
    return CurriculumCalendarWeeklyNoDailyAgendaState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      curriculumCalendarWeeklyNoDailyAgendaModelObj:
      curriculumCalendarWeeklyNoDailyAgendaModelObj ??
          this.curriculumCalendarWeeklyNoDailyAgendaModelObj,
    );
  }
}
