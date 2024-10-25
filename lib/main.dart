import 'package:flutter/material.dart';
import 'package:groceries/view/home/home_screen.dart';
import 'package:groceries/view/login/log_in_view.dart';
import 'package:groceries/view/login/sign_in_view.dart';
import 'package:groceries/view/login/sign_up_view.dart';
import 'package:groceries/view/login/verification_view.dart';
import 'package:groceries/view/login/welcome.dart';
import 'package:groceries/view/splash/splash.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:provider/provider.dart';


import 'common/provider/provider/provider.dart';
import 'common/style/color_extensions/color_extensions.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const App(),
    ),
  );
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const VerificationCodeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
        fontFamily: 'myFont',
      ),
    );
  }
}
