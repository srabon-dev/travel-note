import 'package:flutter/material.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/passport_stamp_page/inner_widgets/custom_alert_delete.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

import 'inner_widgets/passport_stamp_section.dart';

class PassportStampPageScreen extends StatefulWidget {
  const PassportStampPageScreen({super.key});

  @override
  State<PassportStampPageScreen> createState() => _PassportStampPageScreenState();
}

class _PassportStampPageScreenState extends State<PassportStampPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.passportBook,
                color: AppColors.brown100,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              GestureDetector(
                  onTap: (){
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return const CustomAlertDelete();
                      },
                    );
                  },
                  child: const CustomImage(imageSrc: AppIcons.delete))
            ],
          )
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          CustomText(
                            text: AppStrings.all,
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown100,
                          ),
                          CustomText(
                            text: '(30)',
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown100,
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.brown40,
                        margin: const EdgeInsets.only(top: 8,bottom: 16),
                      ),
                      const PassportStampSection()
                    ],
                  ),
                ],
              ),
            ),
      ),
    ));
  }
}
