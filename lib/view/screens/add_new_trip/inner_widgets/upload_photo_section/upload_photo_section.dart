import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/add_new_trip/add_new_trip_controller/add_new_trip_controller.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class UploadPhotoSection extends StatefulWidget {
  const UploadPhotoSection({super.key});

  @override
  State<UploadPhotoSection> createState() => _UploadPhotoSectionState();
}

class _UploadPhotoSectionState extends State<UploadPhotoSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTripController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.photograph),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: "Upload Picture".tr,
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
                    child: controller.imagePhotoFile != null? Image.file(controller.imagePhotoFile?? File("path"),fit: BoxFit.fill,):const Center(
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
