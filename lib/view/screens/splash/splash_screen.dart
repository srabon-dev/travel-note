import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(AppRoutes.bottomNavBar);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                   color: AppColors.white100,
                ),
                child:  const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [

                          CustomImage(
                              imageType: ImageType.png,
                              imageSrc: AppImages.splashLogo
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
      ),
    ));
  }
}