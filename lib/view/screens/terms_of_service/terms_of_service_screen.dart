import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white100,
      appBar: CustomAppBar(
          appBarContent: CustomBackButton(
            text: "Terms of Service".tr,
            color: AppColors.brown100,
          )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
         const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 24, left: 20, bottom: 100, right: 20),
          child: Column(
            children: [
              CustomText(
                text: AppStrings.loremIpsumDolorSitAmet,
                color: AppColors.black100,
                textAlign: TextAlign.start,
                bottom: 16,
              ),
              CustomText(
                text: AppStrings.loremIpsumDolorSitAmet,
                color: AppColors.black100,
                textAlign: TextAlign.start,
                bottom: 16,
              ),
              CustomText(
                text: AppStrings.loremIpsumDolorSitAmet,
                color: AppColors.black100,
                textAlign: TextAlign.start,
                bottom: 16,
              ),
              CustomText(
                text: AppStrings.loremIpsumDolorSitAmet,
                color: AppColors.black100,
                textAlign: TextAlign.start,
                bottom: 16,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
