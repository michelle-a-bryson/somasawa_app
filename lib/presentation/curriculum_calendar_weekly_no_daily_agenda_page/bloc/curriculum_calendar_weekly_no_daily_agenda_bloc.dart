import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_weekly_no_daily_agenda_page/model/curriculum_calendar_weekly_no_daily_agenda_model.dart'; //said models instead of model, throwing error
part 'curriculum_calendar_weekly_no_daily_agenda_event.dart';
part 'curriculum_calendar_weekly_no_daily_agenda_state.dart';

/// A bloc that manages the state of a CurriculumCalendarWeeklyNoDailyAgenda according to the event that is dispatched to it.
class CurriculumCalendarWeeklyNoDailyAgendaBloc extends Bloc<
    CurriculumCalendarWeeklyNoDailyAgendaEvent,
    CurriculumCalendarWeeklyNoDailyAgendaState> {
  CurriculumCalendarWeeklyNoDailyAgendaBloc(
      super.initialState) {
    on<CurriculumCalendarWeeklyNoDailyAgendaInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarWeeklyNoDailyAgendaInitialEvent event,
      Emitter<CurriculumCalendarWeeklyNoDailyAgendaState> emit,
      ) async {
    emit(state.copyWith(rangeSelectionMode: RangeSelectionMode.toggledOn));
  }
}
