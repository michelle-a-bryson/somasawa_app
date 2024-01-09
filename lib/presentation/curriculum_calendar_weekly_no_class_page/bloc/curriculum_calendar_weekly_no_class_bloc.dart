import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_weekly_no_class_page/models/curriculum_calendar_weekly_no_class_model.dart';
part 'curriculum_calendar_weekly_no_class_event.dart';
part 'curriculum_calendar_weekly_no_class_state.dart';

/// A bloc that manages the state of a CurriculumCalendarWeeklyNoClass according to the event that is dispatched to it.
class CurriculumCalendarWeeklyNoClassBloc extends Bloc<
    CurriculumCalendarWeeklyNoClassEvent,
    CurriculumCalendarWeeklyNoClassState> {
  CurriculumCalendarWeeklyNoClassBloc(
      CurriculumCalendarWeeklyNoClassState initialState)
      : super(initialState) {
    on<CurriculumCalendarWeeklyNoClassInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarWeeklyNoClassInitialEvent event,
      Emitter<CurriculumCalendarWeeklyNoClassState> emit,
      ) async {
    emit(state.copyWith(rangeSelectionMode: RangeSelectionMode.toggledOn));
  }
}
