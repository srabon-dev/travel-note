import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';
import 'package:travel_journel/view/screens/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:travel_journel/view/screens/edit_profile/user_model/user_model.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

import 'inner_widget/card_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Travel>? travelList;
  UserModel? userModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    travelList = await SqLiteService.instance.travels();
    print(travelList);
    userModel = await EditProfileController.instance.readUser();
    print("${userModel?.name} Srabon");
    print("${userModel?.country} Srabon");
    print("Srabon Okay ${userModel?.image}");
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            appBarContent: CustomText(
          text: AppStrings.travelJournal.tr,
          color: AppColors.brown100,
          textAlign: TextAlign.center,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        )),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.brown20,
                        ),
                        child: userModel?.image != null?ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              userModel?.image??File("path").readAsBytesSync(),
                              fit: BoxFit.fill,
                            )):const SizedBox(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 20, top: 5, bottom: 5, left: 10),
                            color: AppColors.brown20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    userModel?.name == ""? const CustomText(
                                      text: ' ? ',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black100,
                                    ): CustomText(
                                      text: userModel?.name??"",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black100,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.editProfileScreen);
                                        },
                                        child: const CustomImage(
                                          imageSrc: AppIcons.edit,
                                          size: 18,
                                          imageColor: AppColors.brown100,
                                        )),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: userModel?.country == ""? const CustomText(
                                    text: ' ? ',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black100,
                                    textAlign: TextAlign.left,
                                    top: 8,
                                    bottom: 8,
                                  ): CustomText(
                                    text: userModel?.country??"",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black100,
                                    textAlign: TextAlign.left,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: '${travelList?.length??0} Trips',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black100,
                                    ),
                                    const Row(
                                      children: [
                                        CustomImage(
                                            imageSrc: AppIcons.coins, size: 18),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CustomText(
                                          text: '00',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black100,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.addNewTripScreen);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.add,
                          size: 16,
                          color: AppColors.brown100,
                        ),
                        CustomText(
                          text: "Add New Trip".tr,
                          color: AppColors.brown100,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          // childAspectRatio: MediaQuery.of(context).size.width,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 100,
                        ),
                        itemCount: travelList?.length??0,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.viewTripScreen,arguments: travelList?[index].id??0);
                              },
                              child: CardGridItem(travel: travelList?[index]));
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
