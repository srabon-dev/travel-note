import 'package:flutter/cupertino.dart';
import 'package:travel_journel/utils/app_colors.dart';

class YearGridItem extends StatelessWidget {
  final String year;
  const YearGridItem({super.key, required this.year});
  @override
  Widget build(BuildContext context) {

    String firstPartOfYear = year.substring(0,2);
    String lastPartOfYear = year.substring(2);

    return  Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.brown20,
        borderRadius: BorderRadius.circular(08),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(firstPartOfYear,style: const TextStyle(fontSize: 20,color: AppColors.brown100,fontWeight: FontWeight.bold),),
          Text(lastPartOfYear,style: const TextStyle(fontSize: 20,color: AppColors.brown100,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
