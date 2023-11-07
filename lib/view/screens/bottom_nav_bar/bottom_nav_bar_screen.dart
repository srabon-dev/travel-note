import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_journel/utils/app_icons.dart';
import 'package:travel_journel/view/screens/home/home_screen.dart';
import 'package:travel_journel/view/screens/passport_stamp/passport_stamp_screen.dart';
import 'package:travel_journel/view/screens/settings/settings_screen.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}
class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.currentIndex;
    super.initState();
  }
  static const List<Widget> screens = [
    PassportStampScreen(),
    HomeScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> manuBarItems = [
      MenuBarItems(
          text: "Passport",
          index: 0,
          selectedIndex: selectedIndex,
          image: AppIcons.passport),
      MenuBarItems(
          text: "Journal",
          index: 1,
          selectedIndex: selectedIndex,
          image: AppIcons.journel
      ),
      MenuBarItems(
          text: "Settings".tr,
          index: 2,
          selectedIndex: selectedIndex,
          image: AppIcons.settings
      ),
    ];
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        bottomNavigationBar: Container(
          height: 60,alignment: Alignment.bottomCenter,
          decoration:   const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Color(0xffE8E5DF),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(manuBarItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: manuBarItems[index],
                );
              }),
            ),
          ),
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}

class MenuBarItems extends StatelessWidget {
  const MenuBarItems(
      {super.key,
        required this.image,
        required this.index,
        required this.selectedIndex,
        required this.text});
  final String image;
  final String text;

  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color:selectedIndex == index ? const Color(0xff8C664A) : const Color(0xffE8E5DF)
          ),
          child: Row(
            children: [
              CustomImage(
                  imageColor:selectedIndex == index  ? const Color(0xffffffff) :const Color(0xff8C664A) ,size:18,
                  imageSrc: image),
              CustomText(
                left: 7,
                fontSize: 14,fontWeight: FontWeight.w600,
                text: text,
                color: selectedIndex == index ? const Color(0xffffffff) :  const Color(0xffE8E5DF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}