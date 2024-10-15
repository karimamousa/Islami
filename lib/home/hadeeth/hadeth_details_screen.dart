import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/home/hadeeth/item_hadeth_details.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';
import 'hadeeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName='hadeth_details';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/main_background_dark.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill, //law la2a space yzbto
        ):
        Image.asset('assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill, //law la2a space yzbto
        ),
        Scaffold( //default scaffold background is white we want it transparent
          appBar: AppBar(
            title: Text(args.title,
                style: Theme.of(context).textTheme.bodyLarge
            ),
          ),
          body:
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.06, //responsive ui
              vertical: MediaQuery.of(context).size.height*0.05
            ),
            decoration: BoxDecoration(
            color:
            provider.isDarkMode()?
               AppColors.primaryDarkColor:
               AppColors.whiteColor,
              borderRadius: BorderRadius.circular(90)
            ),
            child: ListView.builder(

                itemCount: args.content.length,
                itemBuilder: (context,index){
                  return ItemHadethDetails(content: args.content[index]);
            }
            ),
          ),
        )
      ],
    ) ;
  }
}

