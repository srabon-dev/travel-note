import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class DeviceUtils{

  static void splashUtils(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarDividerColor: Colors.transparent,
        )
    );
  }
  static innerUtils() {
    SystemChrome.setSystemUIOverlayStyle(
         const SystemUiOverlayStyle(
            statusBarColor: AppColors.white100,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColors.white,
            systemNavigationBarIconBrightness: Brightness.dark
        )
    );
  }
}
