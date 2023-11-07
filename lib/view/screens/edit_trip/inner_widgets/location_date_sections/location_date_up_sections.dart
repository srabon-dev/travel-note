import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/edit_trip/edit_trip_controlle/edit_trip_controlle.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class LocationDateUpSections extends StatefulWidget {
  const LocationDateUpSections({super.key,});
  @override
  State<LocationDateUpSections> createState() => _LocationDateUpSectionsState();
}

class _LocationDateUpSectionsState extends State<LocationDateUpSections> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTripController>(
        builder: (controller) {
          return Column(
            children: [
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.location),
                  SizedBox(width: 8,),
                  CustomText(
                    text: AppStrings.location   ,
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
                hintText: AppStrings.useCurrentLocation,
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
                          hintText: AppStrings.country,
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
                              return "Please Enter Country";
                            }else if (value == ''){
                              return "Please Enter Country";
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
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.date),
                  SizedBox(width: 8,),
                  CustomText(
                    text: AppStrings.date   ,
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
                                Text(controller.startDate, style :const TextStyle(
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
                                Text(controller.endDate, style :const TextStyle(
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
