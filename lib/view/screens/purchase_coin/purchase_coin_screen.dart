import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/utils/app_strings.dart';
import 'package:travel_journel/view/widgets/buttons/bottom_nav_button.dart';
import 'package:travel_journel/view/widgets/buttons/custom_back_button.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';
import 'package:travel_journel/view/widgets/text_field/custom_text_field.dart';

class PurchaseCoinScreen extends StatefulWidget {
  const PurchaseCoinScreen({super.key});

  @override
  State<PurchaseCoinScreen> createState() => _PurchaseCoinScreenState();
}

class _PurchaseCoinScreenState extends State<PurchaseCoinScreen> {
  bool isFullPageAdLoaded = false;
  int selectedCoin = 0;

  late InterstitialAd fullPageAd;
  void initializeFullPageAd() async {
    await InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        fullPageAd = ad;
        isFullPageAdLoaded = true;
      }, onAdFailedToLoad: (err) {
        isFullPageAdLoaded = false;
      }),
    );
  }
  @override
  void initState() {
    initializeFullPageAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white100,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              width: MediaQuery.of(context).size.width,
              height: 271,
              decoration: const ShapeDecoration(
                color: AppColors.brown100,
                image: DecorationImage(
                    image: AssetImage('assets/images/purchase_design.png')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(
                    text: AppStrings.purchaseCoins,
                    color: AppColors.white,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '${selectedCoin==1?20:50}',
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            right: 8,
                            bottom: 8,
                          ),
                          const CustomImage(imageSrc: AppIcons.coins)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: 'Total:',
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            right: 2,
                          ),
                          CustomText(
                            text: '\$ ${selectedCoin==1?1.99:2.99}',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 24, left: 20, bottom: 100, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: AppStrings.selectItems,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brown100,
                      bottom: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: '50 coins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black100,
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: '\$ ${2.99}',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.black100,
                              right: 8,
                            ),
                            Radio(value: 1, groupValue: selectedCoin, onChanged: (value){
                              setState(() {
                                selectedCoin = value!;
                              });
                            },activeColor: AppColors.brown100),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: '20 coins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black100,
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: '\$ ${1.99}',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.black100,
                              right: 8,
                            ),
                            Radio(value: 2, groupValue: selectedCoin, onChanged: (value){
                              setState(() {
                                selectedCoin = value!;
                              });
                            },activeColor: AppColors.brown100,),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.brown100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Credit Card',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.brown100,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                            Border.all(color: AppColors.brown100, width: 1),
                            color: AppColors.brown100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.brown100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomText(
                      text: 'Card Number',
                      fontWeight: FontWeight.w500,
                      color: AppColors.black100,
                      top: 24,
                      bottom: 8,
                    ),
                    const CustomTextField(
                      textAlign: TextAlign.start,
                      hintText: 'Enter card number',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black20),
                      inputTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black100),
                      fieldBorderColor: AppColors.black10,
                      fieldBorderRadius: 8,
                      borderWidth: 1,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Expire Date',
                                fontWeight: FontWeight.w500,
                                color: AppColors.black100,
                                top: 24,
                                bottom: 8,
                              ),
                              CustomTextField(
                                textAlign: TextAlign.start,
                                hintText: 'MM/YY',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black20),
                                inputTextStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.black100),
                                fieldBorderColor: AppColors.black10,
                                fieldBorderRadius: 8,
                                borderWidth: 1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'CVC/CVV',
                                fontWeight: FontWeight.w500,
                                color: AppColors.black100,
                                top: 24,
                                bottom: 8,
                              ),
                              CustomTextField(
                                textAlign: TextAlign.start,
                                hintText: 'CVV',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black20),
                                inputTextStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.black100),
                                fieldBorderColor: AppColors.black10,
                                fieldBorderRadius: 8,
                                borderWidth: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const CustomText(
                      text: 'Amount',
                      fontWeight: FontWeight.w500,
                      color: AppColors.black100,
                      top: 24,
                      bottom: 8,
                    ),
                    const CustomTextField(
                      textAlign: TextAlign.start,
                      hintText: 'Enter amount',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black20),
                      inputTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black100),
                      fieldBorderColor: AppColors.black10,
                      fieldBorderRadius: 8,
                      borderWidth: 1,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavButton(buttonText: AppStrings.buyNow,
            onTap: () {
              if(isFullPageAdLoaded) {
                fullPageAd.show();
                Future.delayed(const Duration(seconds: 2), () {
                  Get.toNamed(AppRoutes.coinRewardScreen);
                });
              }else{

              }
            },
          ),
    ));
  }
}
