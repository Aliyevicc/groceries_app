import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries/view/tabBar/main_tab_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../common/provider/favourite_provider/favourite_provider.dart';

import '../../common/provider/products_model/provider_model.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class DetailScreen extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String weight;
  final String description;
  final String price;

  const DetailScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.description,
    required this.price,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int productQuantity = 1;
  int myItemCount = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final favoriteProvider = Provider.of<FavoritesProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final product = Product(
      name: widget.name,
      price: double.parse(widget.price.replaceAll("\$", "")),
      description: widget.description,
      weight: widget.weight,
      image: widget.imageUrl,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.height * 0.43,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey.withOpacity(0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SafeArea(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.height * 0.25,
                        width: media.width * 0.65,
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
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 37,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    favoriteProvider.isFavorite(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteProvider.isFavorite(product)
                        ? Colors.red
                        : Colors.grey,
                    size: 35,
                  ),
                  onPressed: () {
                    if (favoriteProvider.isFavorite(product)) {
                      favoriteProvider.removeFromFavorites(product);
                    } else {
                      favoriteProvider.addToFavorites(product);
                    }
                    // Sevimli mahsulotlarni saqlash
                    favoriteProvider.saveFavorites();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.weight,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .removeFromCart(product);
                        setState(() {
                          myItemCount --;
                          print(myItemCount);
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 30,
                        color: productQuantity > 1
                            ? TColor.primary
                            : const Color(0xffB3B3B3),
                      ),
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
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Text(
                      '${Provider.of<CartProvider>(context).cartItems[product] ?? 0}',
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(product);
                      setState(() {
                        myItemCount ++;
                        print(myItemCount);
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: TColor.primary,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    '\$${(double.parse(widget.price.replaceAll("\$", "")) * productQuantity).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Product Detail",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.description,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: MaterialButton(
          height: 73,
          minWidth: double.infinity,
          color: TColor.primary,
          disabledColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: (cartProvider.itemCount > 0)
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabBArView(
                  selectedIndex: 2,
                ),
              ),
            );
                }
              : null,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Go to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
