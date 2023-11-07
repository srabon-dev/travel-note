import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/utils/device_utils.dart';
import 'package:travel_journel/view/widgets/buttons/custom_button.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class CoinRewardScreen extends StatefulWidget {
  const CoinRewardScreen({super.key});

  @override
  State<CoinRewardScreen> createState() => _CoinRewardScreenState();
}

class _CoinRewardScreenState extends State<CoinRewardScreen> {
  void initState() {
    DeviceUtils.innerUtils();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child:  Scaffold(
        backgroundColor: AppColors.white100,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:  CustomText(
                  color: AppColors.black100,
                  text: "Congratulation!!!".tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  bottom: 24,
                ),
              ),

              const CustomImage(
                  size: 200,
                  imageType: ImageType.png,
                  imageSrc: AppImages.coinsss
              ),

              CustomText(
                top: 44,
                text: "You won 1 coins".tr,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                bottom: 16,
              ),

              CustomButton(
                  topPadding: 12,
                  bottomPadding: 12,
                  leftPadding: 48,
                  rightPadding: 48,
                  buttonBgColor: AppColors.brown100,
                  onPressed: (){
                    Get.offAndToNamed(AppRoutes.bottomNavBar);
                  },
                  titleText: "Back (to Home)".tr)
            ],
          );
        },

        )
      ),
    );
  }
}
