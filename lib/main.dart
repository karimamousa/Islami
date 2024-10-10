import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import '../home/quran/sura_details_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightMode,
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
      },
    );
  }
}