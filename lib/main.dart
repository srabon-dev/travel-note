import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/view/screens/change_language/languages/languages_translator.dart';
import 'core/route/app_route.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SqLiteService.instance;
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool? lang = sharedPreferences.getBool('lang');
  /*var deviceId = ["31373CB13168498A6EA2DC430CC474F3"];
  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds:deviceId
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);*/
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( MyApp(lang: lang??false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.lang});
  final bool lang;

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute:AppRoutes.splashScreen,
      navigatorKey: Get.key,
      getPages: AppRoutes.routes,
      translations: Languages(),
      locale: lang? const Locale("ja" , "JP") : const Locale("en" , "US"),
      fallbackLocale:const Locale("en" , "US"),
    );
  }
}


