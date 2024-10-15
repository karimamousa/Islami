import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../providers/app_config_provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;
  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Text(
      content,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: provider.isDarkMode()? AppColors.yellowColor: AppColors.blackColor),//you can change it from dark theme too
      textDirection: TextDirection.rtl,
    );
  }
}
