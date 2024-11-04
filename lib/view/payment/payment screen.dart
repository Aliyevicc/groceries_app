import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/view/cart/cart_screen.dart';
import 'package:groceries/view/payment/order_accepted.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:provider/provider.dart';
import '../../common/promocode/app_promo_codes.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';
import 'credit_card_screen.dart';

class PaymentScreen extends StatefulWidget {
  final bool cardInspection;

  const PaymentScreen({
    super.key,
    required this.cardInspection,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCardPaymentSelected = false;
  bool isCashPaymentSelected = false;
  double discount = 0;
  final TextEditingController promoController = TextEditingController();

  void _showPromoCodeDialog(
      BuildContext context, Map<String, dynamic> promoCodes) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Enter Promo Code"),
          content: TextField(
            cursorColor: Colors.grey,
            controller: promoController,
            decoration: const InputDecoration(
              hintText: "Promo Code",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final enteredCode = promoController.text.trim();
                if (enteredCode.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a promo code"),
                      // backgroundColor: TColor.primary,
                    ),
                  );
                  return;
                }

                if (promoCodes.containsKey(enteredCode)) {
                  double discount = promoCodes[enteredCode]!;
                  setState(() {
                    this.discount = discount;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Promo code applied! Discount: ${discount.toStringAsFixed(2)}%"),
                      //   backgroundColor: TColor.primary,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Invalid promo code"),
                      ),
                      // backgroundColor: TColor.primary,
                      padding: EdgeInsets.only(top: 20),
                    ),
                  );
                }

                Navigator.of(context).pop();
              },
              child: const Text(
                "Apply",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.totalPrice;
    double discountAmount = (totalPrice * (discount / 100));
    double discountedPrice = totalPrice - discountAmount;
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabBArView(
                  selectedIndex: 2,
                ),
              ),
            );
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Promo Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListTile(
                  onTap: () {
                    if (promoCodes.isNotEmpty) {
                      Map<String, double> promoMap = {
                        for (var code in promoCodes)
                          code['code']: code['discount'] as double,
                      };
                      _showPromoCodeDialog(context, promoMap);
                    } else {
                      print('No promo codes available.');
                    }
                  },
                  leading: Icon(
                    Icons.text_snippet_rounded,
                    color: TColor.primary,
                  ),
                  title: const Text(
                    "Do you have a promo code?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Payment method",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.creditcard,
                    color: TColor.primary,
                  ),
                  title: const Text(
                    "Payment with a credit card",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: TColor.primary,
                    value: isCardPaymentSelected,
                    onChanged: (value) {
                      setState(() {
                        if (widget.cardInspection && value == true) {
                          isCardPaymentSelected = true;
                        } else {
                          isCardPaymentSelected = value ?? false;
                        }

                        if (isCardPaymentSelected) {
                          isCashPaymentSelected = false;
                        }

                        if (!widget.cardInspection && isCardPaymentSelected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreditCardScreen(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.money_rounded,
                    color: TColor.primary,
                  ),
                  title: const Text(
                    "Payment with a cash",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: TColor.primary,
                    value: isCashPaymentSelected,
                    onChanged: (value) {
                      setState(() {
                        isCashPaymentSelected = value ?? false;
                        if (isCashPaymentSelected) {
                          isCardPaymentSelected = false;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Order",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Delivery",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (discountAmount > 0) ...[
                  Row(
                    children: [
                      const Text(
                        "Promo code",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '-- \$${discountAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      "Discounted Total",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${discountedPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.height * 000.18),
                if (!isCardPaymentSelected && !isCashPaymentSelected)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please choose payment method!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: MaterialButton(
                    color: TColor.primary,
                    height: 65,
                    minWidth: double.infinity,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (isCardPaymentSelected || isCashPaymentSelected)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAcceptedScreen(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
