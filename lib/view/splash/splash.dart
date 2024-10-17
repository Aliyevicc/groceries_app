import 'package:flutter/material.dart';

import '../../common/style/color_extensions/color_extensions.dart';
import '../login/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    fireOpenApp();
  }

  void fireOpenApp() async {
    await Future.delayed(const Duration(seconds: 3));
    startApp();
  }

  void startApp() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeView(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Center(
        child: Image.asset(
          "assets/images/Splash_image.png",
          width: media.width,
          height: media.height,
        ),
      ),
    );
  }
}
