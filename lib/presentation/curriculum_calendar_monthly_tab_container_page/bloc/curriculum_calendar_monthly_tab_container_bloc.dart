import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_tab_container_page/models/curriculum_calendar_monthly_tab_container_model.dart';
part 'curriculum_calendar_monthly_tab_container_event.dart';
part 'curriculum_calendar_monthly_tab_container_state.dart';

/// A bloc that manages the state of a CurriculumCalendarMonthlyTabContainer according to the event that is dispatched to it.
class CurriculumCalendarMonthlyTabContainerBloc extends Bloc<
    CurriculumCalendarMonthlyTabContainerEvent,
    CurriculumCalendarMonthlyTabContainerState> {
  CurriculumCalendarMonthlyTabContainerBloc(
      CurriculumCalendarMonthlyTabContainerState initialState)
      : super(initialState) {
    on<CurriculumCalendarMonthlyTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarMonthlyTabContainerInitialEvent event,
      Emitter<CurriculumCalendarMonthlyTabContainerState> emit,
      ) async {}
}
