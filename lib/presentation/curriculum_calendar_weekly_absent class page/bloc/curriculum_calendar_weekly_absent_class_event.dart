// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_absent_class_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarWeeklyAbsentClass widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarWeeklyAbsentClassEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarWeeklyAbsentClass widget is first created.
class CurriculumCalendarWeeklyAbsentClassInitialEvent
    extends CurriculumCalendarWeeklyAbsentClassEvent {
  @override
  List<Object?> get props => [];
}
