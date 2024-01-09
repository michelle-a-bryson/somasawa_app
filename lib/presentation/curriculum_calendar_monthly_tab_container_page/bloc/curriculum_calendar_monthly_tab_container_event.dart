// ignore_for_file: must_be_immutable

part of 'curriculum_calendar_monthly_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CurriculumCalendarMonthlyTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CurriculumCalendarMonthlyTabContainerEvent extends Equatable {}

/// Event that is dispatched when the CurriculumCalendarMonthlyTabContainer widget is first created.
class CurriculumCalendarMonthlyTabContainerInitialEvent
    extends CurriculumCalendarMonthlyTabContainerEvent {
  @override
  List<Object?> get props => [];
}
