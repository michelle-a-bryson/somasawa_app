// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_daily_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarDaily widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarDailyEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarDaily widget is first created.
class CurriculumCalendarDailyInitialEvent extends CurriculumCalendarDailyEvent {
  @override
  List<Object?> get props => [];
}
