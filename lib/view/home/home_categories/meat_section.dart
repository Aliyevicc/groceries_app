import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../common/products/products_map.dart';
import '../../../common/provider/products_model/provider_model.dart';
import '../../../common/provider/products_provider/provider.dart';
import '../../../common/style/color_extensions/color_extensions.dart';
import '../../detail/detail_screen.dart';

class MeatSection extends StatelessWidget {
  const MeatSection({super.key});

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    List<Product> convertToProductList(List<Map<String, dynamic>> productData) {
      return productData.map((data) {
        return Product(
          name: data['name'],
          price: data['price'],
          description: data['description'],
          weight: data['weight'],
          image: data['image'],
        );
      }).toList();
    }


    List<Map<String, dynamic>> meatData = products['Meat'] ?? [];

    List<Product> meatSection = convertToProductList(meatData);
    return    SizedBox(
      height: media.height * 0.31,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meatSection.length,
        itemBuilder: (context, index) {
          final product = meatSection[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: media.width * 0.44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xffE2E2E2),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: SizedBox(
                      height: media.height * 0.13,
                      width: media.width * 0.6,
                      child: InkWell(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: media.width * 0.05,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.weight,
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: media.width * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      Text(
                        ' \$${product.price.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Provider.of<CartProvider>(context,
                                  listen: false)
                                  .removeFromCart(product);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.remove_circle,color: TColor.primary,),
                          //   onPressed: () {
                          //     Provider.of<CartProvider>(context,
                          //             listen: false)
                          //         .removeFromCart(product);
                          //   },
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${Provider.of<CartProvider>(context).cartItems[product] ?? 0}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<CartProvider>(context,
                                  listen: false)
                                  .addToCart(product);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
