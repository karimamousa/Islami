import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeeth/item_hadeth_name.dart';

import '../../colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeth> ahadethList=[];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty){
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/hadeeth_logo.png')),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty?
              Center(child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),):
          ListView.separated(
            separatorBuilder: (context,index){
              return Divider(
                color: AppColors.primaryLightColor,
                thickness: 3,
              );
            },
            itemBuilder: (context,index){
              return ItemHadethName(hadeth: ahadethList[index],);
            },
            itemCount: ahadethList.length,

          ),
        ),


      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
    await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      print(hadethList[i]);
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }

}
//data class
class Hadeth{
  String title;
  List<String> content;
  Hadeth({required this.title,required this.content});
}
