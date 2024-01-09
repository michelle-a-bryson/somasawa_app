// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_weekly_no_class_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarWeeklyNoClass widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarWeeklyNoClassEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarWeeklyNoClass widget is first created.
class CurriculumCalendarWeeklyNoClassInitialEvent
    extends CurriculumCalendarWeeklyNoClassEvent {
  @override
  List<Object?> get props => [];
}
