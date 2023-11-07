import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/screens/add_new_trip/add_new_trip_controller/add_new_trip_controller.dart';
import 'package:travel_journel/view/widgets/container/custom_container_card.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTripController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.note),
                const SizedBox(
                  width: 8,
                ),
               CustomText(
                  text: "Description".tr,
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
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.comments),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: "Notes".tr,
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
            Row(
              children: [
                const CustomImage(imageSrc: AppIcons.passportStamp),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: "Passport Stamp".tr,
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
                controller.placeMark?[0].country != null? GestureDetector(
                  onTap: () async {
                    try{
                      bool result = await InternetConnectionChecker().hasConnection;
                      if(await Permission.location.isGranted){
                        if(result){
                          //This Is Call select Stamp
                          if (!mounted) return;
                          showReportDialog(country: controller.placeMark?[0].country??"", context: context);
                        }else{
                          Get.snackbar("Internet", "Internet Error");
                        }
                      }else{
                        Permission.location.request();
                      }
                    }catch(error){
                      Get.snackbar("Permission", "Permission Error");
                    }
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
                    content: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              color: AppColors.brown100,
                              textAlign: TextAlign.center,
                              text: '${controller.placeMark?[0].country}',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                    ),
                  ),
                ):
                GestureDetector(
                  onTap: () async {
                    try{
                      bool result = await InternetConnectionChecker().hasConnection;
                      if(await Permission.location.isGranted){
                        if(result){
                          controller.getLocation();
                        }else{
                          Get.snackbar("Internet", "Internet Error");
                        }
                      }else{
                        Permission.location.request();
                      }
                    }catch(error){
                      Get.snackbar("Permission", "Permission Error");
                    }
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
                    content: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.addressLoading? const Center(child: CircularProgressIndicator(),) : const CustomText(
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
  void showReportDialog({
    required String country,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<DocumentSnapshot>(
                future: firebaseFirestore.collection('stamps').doc(country).get(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'.tr));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading...".tr));
                  }
                  Map<String,dynamic> stampData = snapshot.data?.data() as Map<String, dynamic>;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    itemCount: stampData.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.brown100),
                            ),
                            child: Image.network(stampData['name'][index],fit: BoxFit.fill,),
                          )
                      );
                    },
                  );
                }
              ),
            ),
          ),
        );
      },
    );
  }
}
