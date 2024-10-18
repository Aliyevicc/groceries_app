import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/products/products_map.dart';
import '../../common/provider/model/model.dart';
import '../../common/provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    List<Map<String, dynamic>> fruitProducts = products['Fruits'] ?? [];
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

    List<Product> productsList = convertToProductList(fruitProducts);

    return Scaffold(
      backgroundColor: TColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/red_carrot.png",
                    width: media.width * 0.1,
                    height: media.width * 0.1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/metka.png",
                    width: media.width * 0.05,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dhaka,Banassre",
                    style: TextStyle(
                      color: TColor.darkGrey,
                      fontSize: media.width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: media.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/search_icon.png",
                          width: media.width * 0.05,
                          height: media.width * 0.05,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: media.width * 0.045,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: media.height * 0.2,
                  width: media.width * 0.9,
                  child: Image.asset("assets/img/banner_top.png"),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "Exclusive offer",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: media.width * 0.075,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: media.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              SizedBox(
                height: media.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    final product = productsList[index];
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
                                  top: 20, left: 20, right: 20),
                              child: SizedBox(
                                height: media.height * 0.13,
                                width: media.width * 0.6,
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    product.name,
                                    style: TextStyle(
                                      color: TColor.primaryText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: media.width * 0.05,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    product.weight,
                                    style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: media.width * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
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
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle),
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                            listen: false)
                                            .removeFromCart(product);
                                      },
                                    ),
                                    Text(
                                      '${Provider.of<CartProvider>(context).cartItems[product] ?? 0}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle),
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                            listen: false)
                                            .addToCart(product);
                                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
