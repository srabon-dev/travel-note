import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/utils/device_utils.dart';
import 'package:travel_journel/view/screens/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/bottom_nav_button.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  bool isFullPageAdLoaded = false;
  late InterstitialAd fullPageAd;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DeviceUtils.innerUtils();
    initializeFullPageAd();
    final controller = Get.put(EditProfileController.instance);
    controller.readUser();
  }
  void initializeFullPageAd() async {
    await InterstitialAd.load(
      adUnitId: "",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            print("Full Page Ad Loaded!");
            fullPageAd = ad;
            isFullPageAdLoaded = true;
          },
          onAdFailedToLoad: (err) {
            print(err.toString());
            isFullPageAdLoaded = false;
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            appBarContent: CustomBackButton(
          text: "Edit Profile".tr,
          color: AppColors.brown100,
        )),
        body: GetBuilder<EditProfileController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 44,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          controller.openPhotoGallery();
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: controller.imagePhotoFile != null?BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(controller.imagePhotoFile!),
                                    fit: BoxFit.fill),
                                color: AppColors.black100,
                                shape: BoxShape.circle):const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.profile),
                                    fit: BoxFit.fill),
                                color: AppColors.black100,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                              size: 28,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomText(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      text: AppStrings.name,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      textAlign: TextAlign.start,
                      hintText: "Name".tr,
                      textEditingController: controller.name,
                      onChanged: (value){
                        setState(() {
                          controller.name.text = value;
                        });
                      },
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black20),
                      inputTextStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black100),
                      fieldBorderColor: AppColors.black10,
                      fieldBorderRadius: 8,
                      borderWidth: 1,
                      validator: (value){
                        if(value == null){
                          return "Name".tr;
                        }else if (value == ''){
                          return "Name".tr;
                        }else{
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomText(
                      textAlign: TextAlign.start,
                      text: AppStrings.country,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      textAlign: TextAlign.start,
                      hintText: "Country".tr,
                      textEditingController: controller.country,
                      onChanged: (value){
                        setState(() {
                          controller.country.text = value;
                        });
                      },
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black20),
                      inputTextStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black100),
                      fieldBorderColor: AppColors.black10,
                      fieldBorderRadius: 8,
                      borderWidth: 1,
                      validator: (value){
                        if(value == null){
                          return "Country".tr;
                        }else if (value == ''){
                          return "Country".tr;
                        }else{
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        ),
        bottomNavigationBar: GetBuilder<EditProfileController>(
          builder: (controller) {
            return BottomNavButton(
              onTap: () {
                if(formKey.currentState!.validate() && controller.imagePhotoFile != null){
                  controller.insertUser();
                  if(isFullPageAdLoaded) {
                    fullPageAd.show();
                  }else{

                  }
                }else{
                  Get.snackbar("Error", "Please Select Image");
                }
              },
              buttonText: "Save".tr,
            );
          }
        ),
      ),
    );
  }
}
