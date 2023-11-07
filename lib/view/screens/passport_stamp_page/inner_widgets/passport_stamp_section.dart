import 'package:flutter/material.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/utils/app_images.dart';
import 'package:travel_journel/view/widgets/image/custom_image.dart';

class PassportStampSection extends StatefulWidget {
  const PassportStampSection({super.key});

  @override
  State<PassportStampSection> createState() => _PassportStampSectionState();
}

class _PassportStampSectionState extends State<PassportStampSection> {
  List<Map<String , String>> category = [
    {
      "image": AppImages.stamp,
    },
    {
      "image": AppImages.stampBan,
    },
    {
      "image": AppImages.stampGreece,
    },
    {
      "image": AppImages.stampPeru,
    },
    {
      "image": AppImages.stamp,
    },
    {
      "image": AppImages.stampBan,
    },
    {
      "image": AppImages.stampGreece,
    },
    {
      "image": AppImages.stamp,
    },
    {
      "image": AppImages.stampBan,
    },
    {
      "image": AppImages.stampGreece,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // childAspectRatio: MediaQuery.of(context).size.width,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 60
            ),
            itemCount: category.length,
            itemBuilder: (BuildContext context,index){
              return  Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 9),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.brown40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  color: AppColors.white,
                  child:  CustomImage(imageSrc:category[index]["image"].toString() ,imageType: ImageType.png,size: 100,),
                ),
              );
            }),
      ],
    );
  }
}
