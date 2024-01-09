// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_navigate_to_previous_week_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarWeeklyNavigateToPreviousWeek widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarWeeklyNavigateToPreviousWeekEvent
    extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarWeeklyNavigateToPreviousWeek widget is first created.
class CurriculumCalendarWeeklyNavigateToPreviousWeekInitialEvent
    extends CurriculumCalendarWeeklyNavigateToPreviousWeekEvent {
  @override
  List<Object?> get props => [];
}
