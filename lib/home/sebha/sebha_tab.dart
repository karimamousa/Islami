import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehat=0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.isDarkMode()?
              Container(
                margin: EdgeInsets.only(top: 0),
                  child: Image.asset('assets/images/head_of_seb7a_dark.png')):
              Image.asset('assets/images/head of seb7a.png'),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: provider.isDarkMode()?
                    Image.asset('assets/images/seb7a_img_dark.png'):
                    Image.asset('assets/images/seb7a_img.png'),
              ),
            ],
          ),
          Text(AppLocalizations.of(context)!.tasbeha_count),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: provider.isDarkMode()?
              AppColors.primaryDarkColor:
              AppColors.primaryLightColor, 
            ),
              child: Text(tasbehat.toString(),)

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: provider.isDarkMode()?
                  AppColors.yellowColor:
                  AppColors.primaryLightColor
            ),
              onPressed: (){
                tasbehat++;
                setState(() {

                });
              },
              child: Text('سبحان الله',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.blackColor),)
          )
        ],
      ),
    );
  }
}