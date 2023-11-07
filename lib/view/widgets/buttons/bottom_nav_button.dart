import 'package:flutter/material.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/view/widgets/text/custom_text.dart';


class BottomNavButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onTap;
  const BottomNavButton({super.key,
    required this.buttonText,
    required this.onTap});

  @override
  State<BottomNavButton> createState() => _BottomNavButtonState();
}

class _BottomNavButtonState extends State<BottomNavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color:  Colors.transparent,
        padding: const EdgeInsetsDirectional.only(top: 24, bottom: 24,start: 20,end: 20),
        width: MediaQuery.of(context).size.width,
        child:  SizedBox(
            height: 56 ,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor,
                ),
                child:  Center(child: CustomText(
                  text: widget.buttonText,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            )
        )

    );
  }
}
