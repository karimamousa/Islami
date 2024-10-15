import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode()?
                getSelectedItemWidget(AppLocalizations.of(context)!.dark):
                getUnseletedItemWidget(AppLocalizations.of(context)!.dark)
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode()?
                getUnseletedItemWidget(AppLocalizations.of(context)!.light):
                getSelectedItemWidget(AppLocalizations.of(context)!.light)
          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primaryLightColor
          ),),
        Icon(Icons.check,size: 25,color: AppColors.primaryLightColor,)
      ],
    );

  }
  Widget getUnseletedItemWidget(String text){
    return Text(text,
      style: Theme.of(context).textTheme.bodySmall,);

  }
}
