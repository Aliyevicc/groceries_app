import 'package:flutter/material.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:provider/provider.dart';

import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class OrderAcceptedScreen extends StatefulWidget {
  const OrderAcceptedScreen({super.key});

  @override
  State<OrderAcceptedScreen> createState() => _OrderAcceptedScreenState();
}

class _OrderAcceptedScreenState extends State<OrderAcceptedScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Text(
              "Zakazing qabul boldi \n             chort!",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBArView(
                      selectedIndex: 0,
                    ),
                  ),
                );
                cartProvider.clearCart();
              },
              child: const Text(
                "Back to home",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
