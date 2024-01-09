import 'dart:ui';
import 'package:somasawa_app/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillIndigoTL16 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.indigo50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}

