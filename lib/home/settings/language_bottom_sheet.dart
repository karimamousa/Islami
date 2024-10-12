import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
              //change language to english
              provider.changeLanguage('en');

            },
            child: provider.appLanguage == 'en'?
                getSelectedItemWidget(AppLocalizations.of(context)!.english):
                getUnseletedItemWidget(AppLocalizations.of(context)!.english)
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
              //change lang to arabic
            },
            child: provider.appLanguage =='ar'?
                getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
                getUnseletedItemWidget(AppLocalizations.of(context)!.arabic)
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
