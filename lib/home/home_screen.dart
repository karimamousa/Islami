import 'package:flutter/material.dart';
import 'package:islami_app/home/settings/settings_tab.dart';
import '../colors.dart';
import '../home/quran/quran_tab.dart';
import '../home/hadeeth/hadeeth_tab.dart';
import '../home/sebha/sebha_tab.dart';
import '../home/radio/radio_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill, //law la2a space yzbto
        ),
        Scaffold( //default scaffold background is white we want it transparent
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex:selectedIndex ,
              onTap: (index){
                selectedIndex=index;
                setState(() {

                });
              },
              items:  [
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeeth.png')),label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings)
              ],
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    ) ;
  }
  List<Widget> tabs=[
    QuranTab(),HadeethTab(),SebhaTab(),RadioTab(),SettingsTab()
  ];
}
