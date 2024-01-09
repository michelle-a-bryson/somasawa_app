// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_tab_container1_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarMonthlyTabContainer1 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarMonthlyTabContainer1Event extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarMonthlyTabContainer1 widget is first created.
class CurriculumCalendarMonthlyTabContainer1InitialEvent
    extends CurriculumCalendarMonthlyTabContainer1Event {
  @override
  List<Object?> get props => [];
}

