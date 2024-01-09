import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_weekly_absent_class_page/models/curriculum_calendar_weekly_absent_class_model.dart';
part 'curriculum_calendar_weekly_absent_class_event.dart';
part 'curriculum_calendar_weekly_absent_class_state.dart';

/// A bloc that manages the state of a CurriculumCalendarWeeklyAbsentClass according to the event that is dispatched to it.
class CurriculumCalendarWeeklyAbsentClassBloc extends Bloc<
    CurriculumCalendarWeeklyAbsentClassEvent,
    CurriculumCalendarWeeklyAbsentClassState> {
  CurriculumCalendarWeeklyAbsentClassBloc(
      CurriculumCalendarWeeklyAbsentClassState initialState)
      : super(initialState) {
    on<CurriculumCalendarWeeklyAbsentClassInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarWeeklyAbsentClassInitialEvent event,
      Emitter<CurriculumCalendarWeeklyAbsentClassState> emit,
      ) async {
    emit(state.copyWith(rangeSelectionMode: RangeSelectionMode.toggledOn));
  }
}
