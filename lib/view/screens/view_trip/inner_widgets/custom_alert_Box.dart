import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class CustomAlertBox extends StatefulWidget {
  const CustomAlertBox({super.key, required this.id});
  final int id;
  @override
  State<CustomAlertBox> createState() => _CustomAlertBoxState();
}

class _CustomAlertBoxState extends State<CustomAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          const CustomText(
            text: AppStrings.youSureWantToDeleteTrip,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.brown100,
            bottom: 24,
          ),
          Row(
            children: [
              Expanded(
                  child:InkWell(
                    onTap: ()async{
                      await SqLiteService.instance.deleteTrip(widget.id).then((value){
                        Get.snackbar("Success", "Successfully Delete Your Trip");
                        Get.offAndToNamed(AppRoutes.bottomNavBar);
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: AppColors.brown100),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: CustomText(
                            text: AppStrings.yes,
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown100,
                          ),
                        )
                    ),
                  )
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(

                        decoration: BoxDecoration(
                            color: AppColors.brown100,
                            borderRadius:
                            BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12),
                          child:CustomText(
                            text: AppStrings.no,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        )),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
