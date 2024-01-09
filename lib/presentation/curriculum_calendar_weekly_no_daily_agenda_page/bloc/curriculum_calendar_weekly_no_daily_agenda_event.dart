// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_no_daily_agenda_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarWeeklyNoDailyAgenda widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarWeeklyNoDailyAgendaEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarWeeklyNoDailyAgenda widget is first created.
class CurriculumCalendarWeeklyNoDailyAgendaInitialEvent
    extends CurriculumCalendarWeeklyNoDailyAgendaEvent {
  @override
  List<Object?> get props => [];
}
