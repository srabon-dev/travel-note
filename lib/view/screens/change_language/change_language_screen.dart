import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/widgets/app_bar/custom_app_bar.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool lang = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShareData();
  }

  Future<void> getShareData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    lang = sharedPreferences.getBool('lang') ?? false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white100,
      appBar: CustomAppBar(
          appBarContent: CustomBackButton(
        text: AppStrings.changeLanguage.tr,
        color: AppColors.brown100,
      )),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
                  child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.updateLocale(const Locale("en", "US")).then((value) async {
                              SharedPreferences sharePreference = await SharedPreferences.getInstance();
                              sharePreference.setBool("lang", false);
                              Get.snackbar("English", "Language Changed Successfully");
                              setState(() {
                                getShareData();
                              });
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            decoration: ShapeDecoration(
                              color: lang==false? AppColors.black100 : AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: AppColors.black100),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                              child: CustomText(
                                text: "English",
                                color: lang==false? AppColors.white: AppColors.black100,
                                left: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Get.updateLocale(const Locale("ja" , "JP")).then((value) async {
                              SharedPreferences sharePreference = await SharedPreferences.getInstance();
                              sharePreference.setBool("lang", true);
                              Get.snackbar("日本語", "言語が正常に変更されました");
                              setState(() {
                                getShareData();
                              });
                            });
                          } ,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            decoration: ShapeDecoration(
                              color: lang==true? AppColors.black100 : AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: AppColors.black100),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                              child: CustomText(
                                text: "Japanese",
                                color: lang==true? AppColors.white: AppColors.black100,
                                left: 10,
                              ),
                            ),
                          ),
                        )
                      ]
                  ),
                ),
          ),
        ),
    );
  }
}
