import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';
import 'package:travel_journel/view/screens/edit_trip/edit_trip_controlle/edit_trip_controlle.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/bottom_nav_button.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'inner_widgets/bottom_sections/bottom_sections.dart';
import 'inner_widgets/location_date_sections/location_date_up_sections.dart';
import 'inner_widgets/upload_photo_sections/upload_photo_sections.dart';

class EditTripScreen extends StatefulWidget {
  const EditTripScreen({super.key});

  @override
  State<EditTripScreen> createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
  int id = 0;
  @override
  void initState() {
    Get.put(SqLiteService.instance);
    final controller = Get.put(EditTripController(sqLiteService: Get.find()));
    id = Get.arguments;
    controller.readTravel(id: id);
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomAppBar(
              appBarContent: CustomBackButton(
                text: "Edit Trip",
                color: AppColors.brown100,
              )),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return  GetBuilder<EditTripController>(
          builder: (controller) {
            return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
                child: Form(
                  key: formKey,
                  child: controller.isLoading? const Center(child: CircularProgressIndicator()) : const Column(
                    children: [
                      LocationDateUpSections(),
                      SizedBox(
                        height: 16,
                      ),
                      UploadPhotoSections(),
                      SizedBox(height: 16,),
                      BottomSections(),
                    ],
                  ),
                ),
              );
          }
        );
        }
        ),
        bottomNavigationBar: GetBuilder<EditTripController>(
          builder: (controller) {
            return BottomNavButton(
              buttonText: AppStrings.save,
              onTap: () {
                if (controller.startDate.isEmpty && controller.endDate.isEmpty) {
                  Get.snackbar("Error", "Please Enter Date Time");
                } else if(controller.imageStampFile == null){
                  Get.snackbar("Error", "Please Enter Stamp");
                } else if(controller.imagePhotoFile == null){
                  Get.snackbar("Error", "Please Enter Photo");
                }else if (controller.startDate.isNotEmpty &&
                    controller.endDate.isNotEmpty &&
                    formKey.currentState!.validate() &&
                    controller.imageStampFile != null &&
                    controller.imagePhotoFile != null) {
                  controller.editTrip(id: id);
                }
              },);
          }
        )
      ),
    );
  }
}
