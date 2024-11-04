import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/common/widgets/bottom_sheet_widget.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:groceries/view/payment/payment%20screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../common/provider/products_model/provider_model.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';
import '../payment/credit_card_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.0),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            cartProvider.cartItems.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 210),
                        // const SizedBox(height: 50,),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 120,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Your Cart is Empty!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Add some items to your cart to get started.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(height: 30),
                        // ElevatedButton(
                        //   onPressed: () {
                        //
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 40, vertical: 15),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        //   child: const Text(
                        //     "Start Shopping",
                        //     style: TextStyle(fontSize: 16),
                        //   ),
                        // ),
                      ],
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
                              leading:  SizedBox(
                                height: media.height * 0.15,
                                width: media.width * 0.15,
                                child: CachedNetworkImage(
                                  imageUrl: product.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: media.height * 0.13,
                                  placeholder: (context, url) => Center(
                                    child: Lottie.asset(
                                      'assets/lottie/threeDotsLottie.json',
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Center(
                                        child: Lottie.asset(
                                          'assets/lottie/threeDotsLottie.json',
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                ),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          product.name,
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenWidth * 0.05,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      IconButton(
                                        onPressed: () {
                                          cartProvider.removeItem(product);
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.xmark,
                                        ),
                                      ),
                                    ],
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: IconButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .removeFromCart(product);
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 30,
                                            color: quantity > 1
                                                ? TColor.primary
                                                : const Color(0xffB3B3B3),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: media.height * 0.05,
                                        width: media.width * 0.11,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xffE2E2E2),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${Provider.of<CartProvider>(context).cartItems[product] ?? 0}',
                                            style: const TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Center(
                                        child: IconButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .addToCart(product);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: TColor.primary,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
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
                                ],
                              ),
                              // trailing: Column(
                              //   children: [
                              //     InkWell(
                              //       onTap: () {
                              //         cartProvider.removeItem(product);
                              //       },
                              //       child: Icon(
                              //         CupertinoIcons.xmark,
                              //         color: TColor.myGrey,
                              //       ),
                              //     ),
                              //     const SizedBox(height: 10),
                              //   ],
                              // ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      imageUrl: product.image,
                                      name: product.name,
                                      weight: product.weight,
                                      description: product.description,
                                      price: product.price.toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xffE2E2E2),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: cartProvider.cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 30,bottom: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const PaymentScreen(cardInspection: false),
                    ),
                  );
                },
                color: TColor.primary,
                height: 70,
                minWidth: double.infinity,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 35,),
                    const Text(
                      "Go to Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      height: 35,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xff489E67),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '\$${cartProvider.totalPrice.toString()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
