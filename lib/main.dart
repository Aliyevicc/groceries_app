import 'package:flutter/material.dart';
import 'package:groceries/features/screen/login_screen.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:groceries/view/splash/splash.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/provider/favourite_provider/favourite_provider.dart';
import 'common/provider/products_provider/provider.dart';
import 'common/style/color_extensions/color_extensions.dart';


void main() async {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
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
       home: const TabBArView(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
        fontFamily: 'myFont',
      ),
      // home: Center(
      //   child: Image.network(
      //     "https://www.pngplay.com/wp-content/uploads/15/Glass-Bottle-Pepsi-Transparent-PNG.png",
      //     fit: BoxFit.cover,

        //),
      );
  }
}
