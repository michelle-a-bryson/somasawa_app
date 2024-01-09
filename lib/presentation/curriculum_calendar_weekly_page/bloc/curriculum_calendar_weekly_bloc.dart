import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_weekly_page/models/curriculum_calendar_weekly_model.dart';
part 'curriculum_calendar_weekly_event.dart';
part 'curriculum_calendar_weekly_state.dart';

/// A bloc that manages the state of a CurriculumCalendarWeekly according to the event that is dispatched to it.
class CurriculumCalendarWeeklyBloc
    extends Bloc<CurriculumCalendarWeeklyEvent, CurriculumCalendarWeeklyState> {
  CurriculumCalendarWeeklyBloc(CurriculumCalendarWeeklyState initialState)
      : super(initialState) {
    on<CurriculumCalendarWeeklyInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarWeeklyInitialEvent event,
      Emitter<CurriculumCalendarWeeklyState> emit,
      ) async {
    emit(state.copyWith(rangeSelectionMode: RangeSelectionMode.toggledOn));
  }
}
