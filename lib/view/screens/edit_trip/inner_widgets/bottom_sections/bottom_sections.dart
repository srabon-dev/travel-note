import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/edit_trip/edit_trip_controlle/edit_trip_controlle.dart';
import 'package:travel_journel/view/widgets/container/custom_container_card.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class BottomSections extends StatefulWidget {
  const BottomSections({super.key,});

  @override
  State<BottomSections> createState() => _BottomSectionsState();
}

class _BottomSectionsState extends State<BottomSections> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTripController>(
        builder: (controller) {
          return Column(
            children: [
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.note),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: AppStrings.note,
                    color: AppColors.black100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                maxLines: 3,
                maxLength: 50,
                textEditingController: controller.descriptionController,
                fillColor: AppColors.white100,
                textAlign: TextAlign.start,

                hintStyle: GoogleFonts.nunito(
                  fontSize: 16,
                  color: AppColors.black100,
                ),
                inputTextStyle: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.black100
                ),
                fieldBorderColor: AppColors.brown40,
                fieldBorderRadius: 8,
                borderWidth: 1,
                validator: (value){
                  if(value == null){
                    return "Please Enter Description";
                  }else if (value == ''){
                    return "Please Enter Description";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16,),
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.comments),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: AppStrings.comment,
                    color: AppColors.black100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                maxLines: 3,
                textEditingController: controller.noteController,
                fillColor: AppColors.white100,
                textAlign: TextAlign.start,

                hintStyle: GoogleFonts.nunito(
                  fontSize: 16,
                  color: AppColors.black100,
                ),
                inputTextStyle: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.black100
                ),
                fieldBorderColor: AppColors.brown40,
                fieldBorderRadius: 8,
                borderWidth: 1,
                validator: (value){
                  if(value == null){
                    return "Please Enter Note";
                  }else if (value == ''){
                    return "Please Enter Note";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16,),
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.passportStamp),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: AppStrings.passportStamp,
                    color: AppColors.black100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(height: 16,),
              controller.imageStampFile !=null?CustomContainerCard(
                width: MediaQuery.of(context).size.width,
                height: 56,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape:RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color:AppColors.brown100),
                    borderRadius: BorderRadius.circular(8),
                  ) ,
                ),
                content: Padding(
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.check,color: Colors.green,size: 20,),
                            SizedBox(width: 10,),
                            CustomText(
                              color: AppColors.brown100,
                              textAlign: TextAlign.center,
                              text: AppStrings.chooseFromPassport,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {
                          controller.removeStamp();
                        }, icon: const Icon(Icons.cancel,color: Colors.red,size: 20,),),
                      ],
                    )
                ),
              ):Column(
                children: [
                  CustomContainerCard(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape:RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color:AppColors.brown100),
                        borderRadius: BorderRadius.circular(8),
                      ) ,
                    ),
                    content: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              color: AppColors.brown100,
                              textAlign: TextAlign.center,
                              text: AppStrings.chooseFromPassport,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),

                          ],
                        )
                    ),
                  ),
                  const SizedBox(height: 16,),
                  const Center(
                    child: CustomText(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      text: "Or",
                    ),
                  ),
                  const SizedBox(height: 16,),
                  GestureDetector(
                    onTap: (){
                      controller.openStampGallery();
                    },
                    child: CustomContainerCard(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape:RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color:AppColors.brown100),
                          borderRadius: BorderRadius.circular(8),
                        ) ,
                      ),
                      content: const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                color: AppColors.brown100,
                                textAlign: TextAlign.center,
                                text: AppStrings.customMadeStamp,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),

                            ],
                          )
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }
    );
  }
}
