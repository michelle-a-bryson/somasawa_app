import 'package:flutter/material.dart';
import 'package:somasawa_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray100,
  );

  // Gradient decorations
  static BoxDecoration get gradientBlueGrayToIndigo => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [
        appTheme.blueGray90001,
        appTheme.indigo90001,
      ],
    ),
  );

  // Outline decorations
  static BoxDecoration get outlineCyan => BoxDecoration(
    border: Border(
      top: BorderSide(
        color: appTheme.cyan400,
        width: 4.h,
      ),
    ),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
  static BoxDecoration get outlineGray200 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray2002 => BoxDecoration(
    border: Border(
      top: BorderSide(
        color: appTheme.gray200,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineGray2003 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineIndigo => BoxDecoration(
    color: appTheme.indigo50,
    border: Border(
      top: BorderSide(
        color: appTheme.indigo100,
        width: 1.h,
      ),
      left: BorderSide(
        color: appTheme.indigo100,
        width: 1.h,
      ),
      right: BorderSide(
        color: appTheme.indigo100,
        width: 1.h,
      ),
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder24 => BorderRadius.circular(
    24.h,
  );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
    bottom: Radius.circular(12.h),
  );
  static BorderRadius get customBorderTL12 => BorderRadius.vertical(
    top: Radius.circular(12.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
    8.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;

