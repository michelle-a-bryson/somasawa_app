import 'package:somasawa_app/core/app_export.dart';
import 'package:somasawa_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTrailingButton extends StatelessWidget {
  AppbarTrailingButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
    key: key,
  );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: 32.v,
          width: 123.h,
          text: "lbl_add_new_term".tr,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconLeft,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillIndigoTL16,
          buttonTextStyle: CustomTextStyles.labelLargeIndigo900_1,
        ),
      ),
    );
  }
}

