import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName='sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        Image.asset('assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill, //law la2a space yzbto
        ),
        Scaffold( //default scaffold background is white we want it transparent
          appBar: AppBar(
            title: Text(args.name,
                style: Theme.of(context).textTheme.bodyLarge
            ),
          ),
          body:
          verses.isEmpty?Center(child: CircularProgressIndicator(color: AppColors.primaryLightColor,)):
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.06, //responsive ui
              vertical: MediaQuery.of(context).size.height*0.05
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(90)
            ),
            child: ListView.separated(
                separatorBuilder: (context,index){
                  return Divider(
                    color: AppColors.primaryLightColor,
                    thickness: 3,
                  );
                },
                itemCount: verses.length,
                itemBuilder: (context,index){
                  return ItemSuraDetails(content: verses[index], index: index);
            }
            ),
          ),
        )
      ],
    ) ;
  }

  void loadFile(int index) async{ //two codes running at the same time
    String content = await rootBundle.loadString('assets/files/${index+1}.txt'); //wait for content
    List<String> lines = content.split('\n');
    verses=lines;
    setState(() {

    });
  }
}
//data class
class SuraDetailsArgs{
  String name;
  int index;

  SuraDetailsArgs({required this.name,required this.index});
}
