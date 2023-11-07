import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/device_utils.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/container/custom_container_card.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    DeviceUtils.innerUtils();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.white100,
        appBar: CustomAppBar(
          appBarContent: CustomText(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.brown100,
            text: "Settings".tr,
          ),
        ),
      body:  SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          children: [
            CustomContainerCard(
              marginBottom: 24,
              paddingRight: 8,
                paddingLeft: 8,
                paddingBottom: 16,
                paddingTop: 16,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                content:  Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.changeLanguage);
                      },
                      child: Row(
                        children: [
                          const CustomImage(imageSrc: AppIcons.translate,imageColor: AppColors.brown100,),
                          const SizedBox(width: 8,),
                          CustomText(text: "Change Language".tr,fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.brown100,),
                          const Spacer(),
                          const CustomImage(imageSrc: AppIcons.arrowRight,imageColor: AppColors.brown100,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.termsOfServiceScreen);
                      },
                      child: Row(
                        children: [
                          const CustomImage(imageSrc: AppIcons.termsOfService,imageColor: AppColors.brown100,),
                          const SizedBox(width: 8,),
                          CustomText(text: "Terms of Service".tr,fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.brown100,),
                          const Spacer(),
                          const CustomImage(imageSrc: AppIcons.arrowRight,imageColor: AppColors.brown100,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.purchaseCoinScreen);
                      },
                      child: Row(
                        children: [
                          const CustomImage(imageSrc: AppIcons.coin,imageColor: AppColors.brown100,),
                          const SizedBox(width: 8,),
                          CustomText(text: "Coin Purchase".tr,fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.brown100,),
                          const Spacer(),
                          const CustomImage(imageSrc: AppIcons.arrowRight,imageColor: AppColors.brown100,)
                        ],
                      ),
                    ),
                  ],
                )),
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.support),
                const SizedBox(width: 8,),
                CustomText(
                  text: "Support".tr,
                  color: AppColors.brown100,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )
              ],
            ),
            const SizedBox(height: 16,),
            const Divider(height: 1,color: AppColors.brown40,),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: () async{
                launchUrl(
                  Uri.parse("https://google.com"),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.url,imageColor: AppColors.brown100,),
                  SizedBox(width: 8,),
                  Text("https://tokagames.com",style: TextStyle(
                    color: AppColors.brown100,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.mail,imageColor: AppColors.brown100,),
                const SizedBox(width: 8,),
                GestureDetector(
                  onTap: () async{
                    const uri = 'mailto:srabon.bdcalling@gmail.com?subject=News&body=New%20plugin';
                    await launchUrl(Uri.parse(uri));
                  },
                  child: const Text("info@tokagames.com",style: TextStyle(
                      color: AppColors.brown100,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.share),
                const SizedBox(width: 8,),
                Text("Share with friends".tr,style: const TextStyle(
                    color: AppColors.brown100,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
