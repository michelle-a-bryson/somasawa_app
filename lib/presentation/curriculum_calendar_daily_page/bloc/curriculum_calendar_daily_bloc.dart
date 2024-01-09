import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_daily_page/models/curriculum_calendar_daily_model.dart';
part 'curriculum_calendar_daily_event.dart';
part 'curriculum_calendar_daily_state.dart';

/// A bloc that manages the state of a CurriculumCalendarDaily according to the event that is dispatched to it.
class CurriculumCalendarDailyBloc
    extends Bloc<CurriculumCalendarDailyEvent, CurriculumCalendarDailyState> {
  CurriculumCalendarDailyBloc(CurriculumCalendarDailyState initialState)
      : super(initialState) {
    on<CurriculumCalendarDailyInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarDailyInitialEvent event,
      Emitter<CurriculumCalendarDailyState> emit,
      ) async {}
}
