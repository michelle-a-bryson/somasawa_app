import 'bloc/curriculum_calendar_monthly_tab_container1_bloc.dart';
import 'models/curriculum_calendar_monthly_tab_container1_model.dart';
import 'package:somasawa_app/core/app_export.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_page/curriculum_calendar_monthly_page.dart';
import 'package:somasawa_app/presentation/curriculum_calendar_monthly_tab_container_page/curriculum_calendar_monthly_tab_container_page.dart';
import 'package:somasawa_app/widgets/app_bar/appbar_title.dart';
import 'package:somasawa_app/widgets/app_bar/appbar_trailing_button.dart';
import 'package:somasawa_app/widgets/app_bar/custom_app_bar.dart';
import 'package:somasawa_app/widgets/custom_bottom_bar.dart';
import 'package:somasawa_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CurriculumCalendarMonthlyTabContainer1Screen extends StatefulWidget {
  const CurriculumCalendarMonthlyTabContainer1Screen({Key? key})
      : super(
    key: key,
  );

  @override
  CurriculumCalendarMonthlyTabContainer1ScreenState createState() =>
      CurriculumCalendarMonthlyTabContainer1ScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<CurriculumCalendarMonthlyTabContainer1Bloc>(
      create: (context) => CurriculumCalendarMonthlyTabContainer1Bloc(
          CurriculumCalendarMonthlyTabContainer1State(
            curriculumCalendarMonthlyTabContainer1ModelObj:
            CurriculumCalendarMonthlyTabContainer1Model(),
          ))
        ..add(CurriculumCalendarMonthlyTabContainer1InitialEvent()),
      child: CurriculumCalendarMonthlyTabContainer1Screen(),
    );
  }
}

class CurriculumCalendarMonthlyTabContainer1ScreenState
    extends State<CurriculumCalendarMonthlyTabContainer1Screen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurriculumCalendarMonthlyTabContainer1Bloc,
        CurriculumCalendarMonthlyTabContainer1State>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildAddNewTerm(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCardSwitchClasses(context),
                          SizedBox(height: 8.v),
                          _buildTabview(context),
                          SizedBox(
                            height: 915.v,
                            child: TabBarView(
                              controller: tabviewController,
                              children: const [
                                CurriculumCalendarMonthlyPage(),
                                CurriculumCalendarMonthlyPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAddNewTerm(BuildContext context) {
    return SizedBox(
      height: 80.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.gradientBlueGrayToIndigo,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 64.v),
                  Container(
                    height: 16.v,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 1.v,
              width: double.maxFinite,
              decoration: BoxDecoration(),
            ),
          ),
          CustomAppBar(
            title: AppbarTitle(
              text: "lbl_curriculum".tr,
              margin: EdgeInsets.only(left: 16.h),
            ),
            actions: [
              AppbarTrailingButton(
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 1.v,
                  right: 16.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCardSwitchClasses(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgNewIconUnfilledIndigo90048x48,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 4.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_term_2_2023_literacy".tr,
                  style: CustomTextStyles.titleSmallGray900Medium,
                ),
                SizedBox(height: 7.v),
                Text(
                  "lbl_paragraph".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 49.v,
      width: double.maxFinite,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: appTheme.gray900,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: appTheme.gray900,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: appTheme.indigo900,
        tabs: [
          Tab(
            child: Text(
              "lbl_objectives".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_calendar".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Agenda:
        return "/";
      case BottomBarEnum.Curriculum:
        return AppRoutes.curriculumCalendarMonthlyTabContainerPage;
      case BottomBarEnum.Student:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
      BuildContext context,
      String currentRoute,
      ) {
    switch (currentRoute) {
      case AppRoutes.curriculumCalendarMonthlyTabContainerPage:
        return CurriculumCalendarMonthlyTabContainerPage();
      default:
        return DefaultWidget();
    }
  }
}
