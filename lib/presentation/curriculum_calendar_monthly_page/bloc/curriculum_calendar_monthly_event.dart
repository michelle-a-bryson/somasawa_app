// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarMonthly widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarMonthlyEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarMonthly widget is first created.
class CurriculumCalendarMonthlyInitialEvent
    extends CurriculumCalendarMonthlyEvent {
  @override
  List<Object?> get props => [];
}
