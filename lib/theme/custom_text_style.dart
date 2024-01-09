import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray700,
  );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray900,
  );
  // Label text style
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray900,
  );
  static get labelLargeIndigo900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.indigo900,
  );
  static get labelLargeIndigo900_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.indigo900,
  );
  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
  );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray900,
  );
  static get titleSmallGray700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray700,
  );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray900,
  );
  static get titleSmallGray900Medium => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray900,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallIndigo900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.indigo900,
    fontWeight: FontWeight.w500,
  );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

