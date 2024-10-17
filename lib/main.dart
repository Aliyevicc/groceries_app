import 'package:flutter/material.dart';
import 'package:groceries/view/main_tab_bar/main_tab_bar.dart';
import 'package:groceries/view/splash/splash.dart';


import 'common/style/color_extensions/color_extensions.dart';

void main(){
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabBArView(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
        fontFamily: 'myFont',
      ),
    );
  }
}
