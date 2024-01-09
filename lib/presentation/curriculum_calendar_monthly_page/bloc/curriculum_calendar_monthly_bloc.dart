import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_page/models/curriculum_calendar_monthly_model.dart';
part 'curriculum_calendar_monthly_event.dart';
part 'curriculum_calendar_monthly_state.dart';

/// A bloc that manages the state of a CurriculumCalendarMonthly according to the event that is dispatched to it.
class CurriculumCalendarMonthlyBloc extends Bloc<CurriculumCalendarMonthlyEvent,
    CurriculumCalendarMonthlyState> {
  CurriculumCalendarMonthlyBloc(CurriculumCalendarMonthlyState initialState)
      : super(initialState) {
    on<CurriculumCalendarMonthlyInitialEvent>(_onInitialize);
  }

  _onInitialize(
      CurriculumCalendarMonthlyInitialEvent event,
      Emitter<CurriculumCalendarMonthlyState> emit,
      ) async {
    emit(state.copyWith(
      rangeSelectionMode: RangeSelectionMode.toggledOn,
    ));
  }
}
