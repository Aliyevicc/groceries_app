import 'package:flutter/material.dart';
import 'package:groceries/common/provider/credit_card_provider/credit_card_provider.dart';
import 'package:groceries/view/login/verification_view.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:provider/provider.dart';
import 'common/provider/favourite_provider/favourite_provider.dart';
import 'common/provider/products_provider/provider.dart';
import 'common/style/color_extensions/color_extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) =>CardProvider()),
        ChangeNotifierProvider(create: (_) {
          var favoritesProvider = FavoritesProvider();
          favoritesProvider.loadFavorites();
          return favoritesProvider;
        }),
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
