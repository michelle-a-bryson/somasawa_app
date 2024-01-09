// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarWeekly widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarWeeklyEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarWeekly widget is first created.
class CurriculumCalendarWeeklyInitialEvent
    extends CurriculumCalendarWeeklyEvent {
  @override
  List<Object?> get props => [];
}
