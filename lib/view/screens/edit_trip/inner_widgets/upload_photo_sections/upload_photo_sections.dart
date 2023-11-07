import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/edit_trip/edit_trip_controlle/edit_trip_controlle.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class UploadPhotoSections extends StatefulWidget {
  const UploadPhotoSections({super.key,});
  @override
  State<UploadPhotoSections> createState() => _UploadPhotoSectionsState();
}

class _UploadPhotoSectionsState extends State<UploadPhotoSections> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTripController>(
        builder: (controller) {
          return Column(
            children: [
              const Row(
                children: [
                  CustomImage(imageSrc: AppIcons.photograph),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: AppStrings.uploadPhotoOnlyOne,
                    color: AppColors.black100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: (){
                  controller.openPhotoGallery();
                },
                child: DottedBorder(
                    padding: const EdgeInsets.all(0),
                    dashPattern: const [
                      12,
                      12,
                    ],
                    color: AppColors.brown100,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:AppColors.white80,
                      ),
                      child: controller.imagePhotoFile != null? Image.memory(controller.imagePhotoFile?? File("path").readAsBytesSync(),fit: BoxFit.fill,):const Center(
                          child: CustomImage(
                            imageSrc: AppIcons.group,
                            size: 40,
                          )),
                    )),
              ),
            ],
          );
        }
    );
  }
}
