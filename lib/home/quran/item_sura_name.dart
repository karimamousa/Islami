import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
//this file is used to make objects of sura name that will be displayed in a list in quran tab
class ItemSuraName extends StatelessWidget {
  String name;
  int index;
  ItemSuraName({required this.name,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell( //or gesture detector ,to detect taps without using buttons
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
        arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
