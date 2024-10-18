import 'package:flutter/material.dart';
import 'package:groceries/view/login/sign_in_view.dart';


import '../../common/widgets/round_button.dart';
import '../tabBar/main_tab_bar.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome_image.png",
            height: media.height,
            width: media.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/carrot.png"),
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/texts/welcom_text.png"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Ger your groceries in as fast as one our",
                  style: TextStyle(
                      color: Colors.grey, fontSize: media.width * 0.05),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabBArView(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
