import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:travel_journel/utils/app_colors.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';

class CardGridItem extends StatelessWidget {
  final Travel? travel;
  const CardGridItem({super.key, required this.travel});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brown20,
        borderRadius: BorderRadius.circular(08),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(travel?.image??File("path").readAsBytesSync(),
                fit: BoxFit.fill,),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 3,top: 3, bottom: 2),
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFF0F0ED).withOpacity(0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(travel?.startDate??"",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                  Text(travel?.city??"",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400),maxLines: 2,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
