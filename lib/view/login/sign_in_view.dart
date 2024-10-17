import 'package:flutter/material.dart';
import 'package:groceries/common/widgets/round_button.dart';

import '../../common/style/color_extensions/color_extensions.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: media.height * 0.62),
            child: Image.asset(
              "assets/images/vegetables.png",
              height: media.height,
              width: media.width,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: media.width * 1.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Get your groceries \nwith nectar",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: media.width * 0.09,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Or connect with social media",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundIconButton(
                    title: "Continue with Google",
                    onPressed: () {},
                    icon: "assets/images/google_logo.png",
                    color: const Color(0xff5383EC),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundIconButton(
                    title: "Continue with facebook",
                    onPressed: () {},
                    icon: "assets/images/facebook_logo.png",
                    color: const Color(0xff4A66AC),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
