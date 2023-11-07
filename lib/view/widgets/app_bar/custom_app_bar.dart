import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final Widget appBarContent;
  const CustomAppBar({

    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = Colors.transparent,
    required this.appBarContent,
    super.key
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(appBarWidth ?? double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsetsDirectional.only(start: 20, top: 24, end: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.appBarBgColor
          ),
          child: Center(child: widget.appBarContent),
        ),
      ),
    );
  }
}
