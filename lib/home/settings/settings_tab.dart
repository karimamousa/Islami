import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/home/settings/language_bottom_sheet.dart';
import 'package:islami_app/home/settings/theme_bottom_sheet.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';


class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {


  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    Map <String,String>languages = { //for when i have multiple languages
      'en': AppLocalizations.of(context)!.english,
      'ar': AppLocalizations.of(context)!.arabic
    };
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(
            height: 15,

          ),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: provider.isDarkMode()?
                AppColors.yellowColor:
                AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languages[provider.appLanguage]!,
                  style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down,size: 35,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,

          ),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(
            height: 15,

          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()?
                  AppColors.yellowColor:
                  AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode()?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down,size: 35,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=>ThemeBottomSheet());
  }
}
