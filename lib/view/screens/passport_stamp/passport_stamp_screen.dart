import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/custom_button.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class PassportStampScreen extends StatefulWidget {
  const PassportStampScreen({super.key});

  @override
  State<PassportStampScreen> createState() => _PassportStampScreenState();
}

class _PassportStampScreenState extends State<PassportStampScreen> {
  bool select = true;
  List<String> stampList =[
    AppImages.stamp,
    AppImages.stampBan,
    AppImages.stampGreece,
    AppImages.stamp,
    AppImages.stampPeru,
    AppImages.stampBan,
    AppImages.stamp,
    AppImages.stampBan,
    AppImages.stampGreece,
    AppImages.stamp,
    AppImages.stampPeru,
    AppImages.stampBan,
    AppImages.stamp,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
          appBarContent: CustomText(
        text: AppStrings.passportBook,
        color: AppColors.brown100,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              child: Column(
                children: [
                  select? Row(
              children: [
              CustomText(
                text: "All".tr,
                fontWeight: FontWeight.w600,
                color: AppColors.brown100,
              ),
              const CustomText(
                text: '(00)',
                fontWeight: FontWeight.w600,
                color: AppColors.brown100,
              ),
              ],
            ): const Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: AppStrings.all,
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown100,
                          ),
                          CustomText(
                            text: '(00)',
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown100,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                  select?GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // childAspectRatio: MediaQuery.of(context).size.width,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    itemCount: stampList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.brown100),
                            ),
                            child: Image.asset(stampList[index],fit: BoxFit.fill,),
                          )
                      );
                    },
                  ):Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'You have no stamps.',
                          fontWeight: FontWeight.w600,
                          color: AppColors.black40,
                        ),
                        CustomText(
                          text: 'You need 20 coins to unlock the Passport Book'.tr,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black40,
                          bottom: 16,
                        ),
                        CustomButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.purchaseCoinScreen);
                          },
                          titleText: AppStrings.purchaseStamps,
                          titleColor: AppColors.brown100,
                          buttonBgColor: AppColors.primaryColor,
                          titleSize: 16,
                          titleWeight: FontWeight.w600,
                          leftPadding: 36,
                          rightPadding: 36,
                          topPadding: 10,
                          bottomPadding: 10,
                        )
                      ],
                    ),
                ],
              ),
            ),
      ),
    ));
  }
}
