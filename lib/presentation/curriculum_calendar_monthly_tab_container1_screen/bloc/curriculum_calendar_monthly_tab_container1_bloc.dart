import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_tab_container1_screen/models/curriculum_calendar_monthly_tab_container1_model.dart';
part 'curriculum_calendar_monthly_tab_container1_event.dart';
part 'curriculum_calendar_monthly_tab_container1_state.dart';

/// A bloc that manages the state of a CurriculumCalendarMonthlyTabContainer1 according to the event that is dispatched to it.
class CurriculumCalendarMonthlyTabContainer1Bloc extends Bloc<
    CurriculumCalendarMonthlyTabContainer1Event,
    CurriculumCalendarMonthlyTabContainer1State> {
  CurriculumCalendarMonthlyTabContainer1Bloc(
      CurriculumCalendarMonthlyTabContainer1State initialState)
      : super(initialState) {
    on<CurriculumCalendarMonthlyTabContainer1InitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarMonthlyTabContainer1InitialEvent event,
      Emitter<CurriculumCalendarMonthlyTabContainer1State> emit,
      ) async {}
}

