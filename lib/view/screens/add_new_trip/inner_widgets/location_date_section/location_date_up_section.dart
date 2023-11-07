import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/add_new_trip/add_new_trip_controller/add_new_trip_controller.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class LocationDateUpSection extends StatefulWidget {
  const LocationDateUpSection({super.key});

  @override
  State<LocationDateUpSection> createState() => _LocationDateUpSectionState();
}

class _LocationDateUpSectionState extends State<LocationDateUpSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTripController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                CustomImage(imageSrc: AppIcons.location),
                SizedBox(width: 8,),
                CustomText(
                  text: 'Trip Title (Optional)'.tr  ,
                  color: AppColors.black100,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const SizedBox(height: 16,),
            CustomTextField(
              textEditingController: controller.titleController,
              isPrefixIcon: false,
              prefixIconColor: AppColors.brown40,
              textAlign: TextAlign.start,
              hintText: 'Trip Title (Optional)'.tr,
              hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.brown40),
              inputTextStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.black100),
              fieldBorderColor: AppColors.brown40,
              fieldBorderRadius: 8,
              borderWidth: 1,
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        textEditingController: controller.cityController,
                        isPrefixIcon: true,
                        prefixIconSrc:AppIcons.city,
                        prefixIconColor: AppColors.brown40,
                        textAlign: TextAlign.start,
                        hintText: AppStrings.city,
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.brown40),
                        inputTextStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black100),
                        fieldBorderColor: AppColors.brown40,
                        fieldBorderRadius: 8,
                        borderWidth: 1,
                        validator: (value){
                          if(value == null){
                            return "Please Enter City";
                          }else if (value == ''){
                            return "Please Enter City";
                          }else{
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        textEditingController: controller.countryController,
                        isPrefixIcon: true,
                        prefixIconSrc: AppIcons.globe,
                        prefixIconColor: AppColors.brown40,
                        textAlign: TextAlign.start,
                        hintText: "Country".tr,
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.brown40),
                        inputTextStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black100),
                        fieldBorderColor: AppColors.brown40,
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
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                CustomImage(imageSrc: AppIcons.date),
                SizedBox(width: 8,),
                CustomText(
                  text: "Date".tr   ,
                  color: AppColors.black100,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const SizedBox(height: 16,),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          try{
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year),
                                lastDate: DateTime(2030))
                                .then((value) {
                              setState(() {
                                if(value != null){
                                  controller.startDate = DateFormat("yyyy-MM-dd").format(value);
                                }
                              });
                            });
                          }catch(error){
                            Get.snackbar("Error", "Calender Open Error");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.brown40),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,size: 18, color: AppColors.brown40,),
                              const SizedBox(width: 8,),
                              Text(controller.startDate == ''?"Start Date": controller.startDate, style :const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.brown40)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          try{
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year),
                                lastDate: DateTime(2030))
                                .then((value) {
                              setState(() {
                                if(value != null){
                                  controller.endDate = DateFormat("yyyy-MM-dd").format(value);
                                }
                              });
                            });
                          }catch(error){
                            Get.snackbar("Error", "Calender Open Error");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.brown40),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,size: 18, color: AppColors.brown40,),
                              const SizedBox(width: 8,),
                              Text(controller.endDate == ''?"End Date": controller.endDate, style :const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.brown40)),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),

          ],
        );
      }
    );
  }
}
