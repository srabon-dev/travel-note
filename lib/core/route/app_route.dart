import 'package:get/get.dart';
import 'package:travel_journel/view/screens/add_new_trip/add_new_trip_screen.dart';
import 'package:travel_journel/view/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:travel_journel/view/screens/change_language/change_language_screen.dart';
import 'package:travel_journel/view/screens/coin_reward/coin_reward_screen.dart';
import 'package:travel_journel/view/screens/edit_profile/edit_profile_screen.dart';
import 'package:travel_journel/view/screens/edit_trip/edit_trip_screen.dart';
import 'package:travel_journel/view/screens/home/home_screen.dart';
import 'package:travel_journel/view/screens/passport_stamp/passport_stamp_screen.dart';
import 'package:travel_journel/view/screens/passport_stamp_page/passport_stamp_page_screen.dart';
import 'package:travel_journel/view/screens/purchase_coin/purchase_coin_screen.dart';
import 'package:travel_journel/view/screens/settings/settings_screen.dart';
import 'package:travel_journel/view/screens/splash/splash_screen.dart';
import 'package:travel_journel/view/screens/terms_of_service/terms_of_service_screen.dart';
import 'package:travel_journel/view/screens/view_trip/view_trip_screen.dart';
class AppRoutes{

  static const String changeLanguage = "/change_language";
  static const String termsOfServiceScreen = "/terms_of_service";
  static const String purchaseCoinScreen = "/purchase_coin_screen";
  static const String viewTripScreen = "/view_trip_screen";
  static const String passportStampScreen = "/passport_stamp_screen";
  static const String homeZeroStateScreen = "/home_zero_state_screen";
  static const String passportStampPageScreen = "/passport_stamp_page_screen";
  static const String homeScreen = "/home_screen";
  static const String splashScreen = "/splash_screen";
  static const String editProfileScreen = "/edit_profile_Screen.dart";
  static const String settingScreen = "/settings_screen.dart";
  static const String addNewTripScreen = "/add_new_trip_screen.dart";
  static const String editTripScreen = "/edit_trip_screen.dart";
  static const String coinRewardScreen = "/coin_reward_screen.dart";
  static const String bottomNavBar = "/bottom_nav_bar";


  static List<GetPage> routes =[
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: editProfileScreen, page: ()=> const EditProfileScreen()),
    GetPage(name: settingScreen, page: ()=> const SettingScreen()),
    GetPage(name: addNewTripScreen, page: ()=> const AddNewTripScreen()),
    GetPage(name: editTripScreen, page: ()=> const EditTripScreen()),
    GetPage(name: coinRewardScreen, page: ()=> const CoinRewardScreen()),
    GetPage(name: changeLanguage, page: ()=> const ChangeLanguageScreen()),
    GetPage(name: termsOfServiceScreen, page: ()=> const TermsOfServiceScreen()),
    GetPage(name: purchaseCoinScreen, page: ()=> const PurchaseCoinScreen()),
    GetPage(name: viewTripScreen, page: ()=> const ViewTripScreen()),
    GetPage(name: passportStampScreen, page: ()=> const PassportStampScreen()),
    GetPage(name: passportStampPageScreen, page: ()=> const PassportStampPageScreen()),
    GetPage(name: homeScreen, page: ()=> const HomeScreen()),
    GetPage(name: bottomNavBar, page: ()=>  const CustomNavBar(currentIndex: 1)),
  ];

}