import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_weekly_navigate_to_previous_week_page/models/curriculum_calendar_weekly_navigate_to_previous_week_model.dart';
part 'curriculum_calendar_weekly_navigate_to_previous_week_event.dart';
part 'curriculum_calendar_weekly_navigate_to_previous_week_state.dart';

/// A bloc that manages the state of a CurriculumCalendarWeeklyNavigateToPreviousWeek according to the event that is dispatched to it.
class CurriculumCalendarWeeklyNavigateToPreviousWeekBloc extends Bloc<
    CurriculumCalendarWeeklyNavigateToPreviousWeekEvent,
    CurriculumCalendarWeeklyNavigateToPreviousWeekState> {
  CurriculumCalendarWeeklyNavigateToPreviousWeekBloc(
      CurriculumCalendarWeeklyNavigateToPreviousWeekState initialState)
      : super(initialState) {
    on<CurriculumCalendarWeeklyNavigateToPreviousWeekInitialEvent>(
        _onInitialize);
  }

  _onInitialize(
      CurriculumCalendarWeeklyNavigateToPreviousWeekInitialEvent event,
      Emitter<CurriculumCalendarWeeklyNavigateToPreviousWeekState> emit,
      ) async {
    emit(state.copyWith(rangeSelectionMode: RangeSelectionMode.toggledOn));
  }
}
