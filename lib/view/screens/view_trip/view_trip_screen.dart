import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'inner_widgets/custom_alert_Box.dart';

class ViewTripScreen extends StatefulWidget {
  const ViewTripScreen({super.key});

  @override
  State<ViewTripScreen> createState() => _ViewTripScreenState();
}

class _ViewTripScreenState extends State<ViewTripScreen> {
  Travel? travelList;
  bool isLoading = false;
  int id = 0;
  @override
  void initState() {
    super.initState();
    id = Get.arguments;
    refreshNotes(id: id);
  }

  Future refreshNotes({required int id}) async {
    setState(() => isLoading = true);
    travelList = await SqLiteService.instance.readTravel(id);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white100,
      appBar: CustomAppBar(appBarContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(
            text: "Travel Journal".tr,
            color: AppColors.brown100,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        PopupMenuButton(
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight:Radius.circular(0),
              bottomLeft: Radius.circular(8),
              topLeft: Radius.circular(8)
            ),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.brown100
            )
          ),
            color: AppColors.white,
            icon: const Icon(
              Icons.more_vert_outlined,
              color: AppColors.brown100,
            ),
            elevation: 0,
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: GestureDetector(
                    onTap:(){
                      Get.offAndToNamed(AppRoutes.editTripScreen,arguments: id);
                    },
                    child: Row(
                      children: [
                       const CustomImage(imageSrc: AppIcons.edit,imageColor: AppColors.black100,size: 18,),
                        CustomText(
                          text: "Edit".tr,
                          color: AppColors.black100,
                          left: 18,
                        )
                      ],
                    ),
                  )),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return CustomAlertBox(id: id,);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      const CustomImage(imageSrc: AppIcons.delete,imageColor: AppColors.black100,size: 18,),
                      CustomText(
                        text: "Delete".tr,
                        color: AppColors.black100,
                        left: 18,
                      )
                    ],
                  ),
                ),
              ),
            ])


        ],
      )),
      body:  LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 24, left: 20, bottom: 100, right: 20),
          child: isLoading?const Center(child: CircularProgressIndicator(),) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: travelList?.title??"",
                bottom: 16,
                fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
              ),
              Row(
                children: [
                  const CustomImage(imageSrc: AppIcons.location,),
                  CustomText(
                    text: '${travelList?.city??""},',
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black100,
                    left: 12,
                  ),
                  Flexible(
                    child: CustomText(
                      text: travelList?.country??"",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black100,
                      left: 4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const CustomImage(imageSrc: AppIcons.calendar,),
                  CustomText(
                    text: travelList?.startDate??"",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black100,
                    left: 12,
                  )
                ],
              ),
              const SizedBox(height: 8,),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.brown40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.memory(travelList?.image??File("path").readAsBytesSync(),fit: BoxFit.fill,)),
                    ),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: travelList?.note??"",
                      fontSize: 16,
                      color: AppColors.black100,
                      top: 8,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'Note'.tr,
                        fontWeight: FontWeight.w600,
                        color: AppColors.brown100,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        top: 16,
                        bottom: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/7,
                        padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.brown40),
                        ),
                        child: CustomText(
                          textAlign: TextAlign.start,
                          text: travelList?.description??"",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: 'Passport Stamp'.tr,
                        fontWeight: FontWeight.w600,
                        color: AppColors.brown100,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        top: 16,
                        bottom: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2-50,
                        height: MediaQuery.of(context).size.height/7,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.brown40),
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.memory(travelList?.stamp??File("path").readAsBytesSync(),fit: BoxFit.fill,)),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: CustomText(
                    text: "Download".tr,
                    fontWeight: FontWeight.w600,
                    color: AppColors.brown100,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    top: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
