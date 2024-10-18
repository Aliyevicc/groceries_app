import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/provider/model/provider_model.dart';
import '../../common/provider/provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            cartProvider.cartItems.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Cart is empty",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  Product product =
                  cartProvider.cartItems.keys.toList()[index];
                  int quantity = cartProvider.cartItems[product] ?? 0;

                  return Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          product.image,
                          height: screenWidth * 0.15,
                          width: screenWidth * 0.15,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.05,
                              ),
                            ),
                            Text(
                              product.weight,
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                InkWell(
                                  onTap: quantity > 1
                                      ? () {
                                    cartProvider
                                        .removeFromCart(product);
                                  }
                                      : null,
                                  child: Container(
                                    height: 39,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(16),
                                      border: Border.all(
                                        color: const Color(0xffE2E2E2),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/minus_in_container.png",
                                      height: 5,
                                      width: 5,
                                      color: quantity > 1
                                          ? TColor.primary
                                          : const Color(0xffB3B3B3),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: screenWidth * 0.06,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    cartProvider.addToCart(product);
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(16),
                                      border: Border.all(
                                        color: const Color(0xffE2E2E2),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/plus_in_container.png",
                                      height: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 80),
                                Text(
                                  '\$${(product.price * quantity).toStringAsFixed(1)}',
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                cartProvider.removeItem(product);
                              },
                              child: Icon(
                                CupertinoIcons.xmark,
                                color: TColor.myGrey,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
