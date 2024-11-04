import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../common/products/products_map.dart';
import '../../common/provider/products_model/provider_model.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int myItemCount = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryProducts = products[widget.categoryName] ?? [];
    var media = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 2,
            //  crossAxisSpacing: 1,
            childAspectRatio: 1.5 / 2,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            var productData = categoryProducts[index];
            var product = Product(
              name: productData['name'],
              weight: productData['weight'],
              description: productData['description'],
              price: productData['price'],
              image: productData['image'],
            );

            return InkWell(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: media.width * 0.46,
                  height: media.height * 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: const Color(0xffE2E2E2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: media.height * 0.13,
                          width: media.width * 0.6,
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
                            errorWidget: (context, url, error) => Center(
                              child: Lottie.asset(
                                'assets/lottie/threeDotsLottie.json',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 25,
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
                                 setState(() {
                                   myItemCount --;
                                 });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: TColor.primary,
                                    borderRadius: BorderRadius.circular(12),
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
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addToCart(product);
                                setState(() {
                                  myItemCount ++;
                                });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: TColor.primary,
                                    borderRadius: BorderRadius.circular(12),
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
              ),
            );
          },
        ),
      ),
      floatingActionButton: cartProvider.cartItems.isNotEmpty ? Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TabBArView(selectedIndex: 2,),),);
              },
              height: 60,
              minWidth: 150,
              color: TColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Text(
                    "Go to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ) : null
    );
  }
}
