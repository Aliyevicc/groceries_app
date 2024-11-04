import 'package:flutter/material.dart';
import 'package:groceries/common/style/color_extensions/color_extensions.dart';
import 'package:lottie/lottie.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Details",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),

        ),
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset("assets/lottie/we_are_working_on_it.json"),
          ),
          const Center(
            child: Text(
              "We are working on it",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "This feature is in development and will be \n                          available soon",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
