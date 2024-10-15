import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';


class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Text(
      '$content (${index+1})',
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(color:provider.isDarkMode()? AppColors.yellowColor: AppColors.blackColor,),
      textDirection: TextDirection.rtl,


    );
  }
}
