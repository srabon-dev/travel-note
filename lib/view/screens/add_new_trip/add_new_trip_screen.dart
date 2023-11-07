import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/view/screens/add_new_trip/add_new_trip_controller/add_new_trip_controller.dart';
import 'package:travel_journel/view/screens/add_new_trip/inner_widgets/location_date_section/location_date_up_section.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/bottom_nav_button.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'inner_widgets/bottom_section/bottom_section.dart';
import 'inner_widgets/upload_photo_section/upload_photo_section.dart';

class AddNewTripScreen extends StatefulWidget {
  const AddNewTripScreen({super.key});

  @override
  State<AddNewTripScreen> createState() => _AddNewTripScreenState();
}

class _AddNewTripScreenState extends State<AddNewTripScreen> {
  @override
  void initState() {
    Get.put(SqLiteService.instance);
    Get.put(AddNewTripController(sqLiteService: Get.find()));
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
            appBarContent: CustomBackButton(
          text: "Add New Trip".tr,
          color: AppColors.brown100,
        )),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 24),
          child: Form(
            key: formKey,
            child: const Column(
              children: [
                LocationDateUpSection(),
                SizedBox(
                  height: 16,
                ),
                UploadPhotoSection(),
                SizedBox(
                  height: 16,
                ),
                BottomSection(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<AddNewTripController>(
          builder: (controller) {
            return BottomNavButton(
              buttonText: "Save".tr,
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
                  controller.saveNewTrip();
                }
              },
            );
          }
        ),
      ),
    );
  }
}
