import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth/hadeth_details_screen.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'hadeeth_tab.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell( //or gesture detector ,to detect taps without using buttons
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments: hadeth);
      },
      child: Text(hadeth.title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
