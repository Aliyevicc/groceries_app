import 'package:flutter/material.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../common/geolocator/geolocator_settings.dart';
import 'package:lottie/lottie.dart'; // Lottie import qiling
import '../../common/geolocator/geolocator_settings.dart';
import '../../common/products/products_map.dart';
import '../../common/provider/model/provider_model.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String? _currentCity;

  @override
  void initState() {
    super.initState();
    _loadCurrentCity();
  }

  void _loadCurrentCity() async {
    String? city = await getCurrentCity();
    setState(() {
      _currentCity = city;
    });
  }

  Future<void> _refreshData() async {
    // Your refresh logic here, for example, reloading the products
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network delay
    // If you have data fetching logic, call it here
    // setState(() {
    //   // Update your state if needed
    // });
  }
  String? _currentCity;

  @override
  void initState() {
    super.initState();
    _loadCurrentCity();
  }

  void _loadCurrentCity() async {
    String? city = await getCurrentCity();
    setState(() {
      _currentCity = city;
    });
  }

  Future<void> _refreshData() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network delay
    // setState(() {
    //   // Update your state if needed
    // });
  }

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

    List<Map<String, dynamic>> exclusiveOfferData =
        products['Exclusive offer'] ?? [];
    List<Map<String, dynamic>> bestSellingData = products['Best selling'] ?? [];

    List<Product> exclusiveOffer = convertToProductList(exclusiveOfferData);
    List<Product> bestSelling = convertToProductList(bestSellingData);

    return Scaffold(
      backgroundColor: TColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
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
                  const SizedBox(width: 10),
                  Text(
                    "Uzbekistan,Tashkent",
                    style: TextStyle(
                      color: TColor.darkGrey,
                      fontSize: media.width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Search Bar
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

              // Exclusive Offer Section
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Exclusive Offer",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveOffer.length,
                  itemBuilder: (context, index) {
                    final product = exclusiveOffer[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: media.height * 0.13,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return Center(
                                        child: Lottie.asset(
                                          'assets/lottie/myLoading.json',
                                          height: 80,
                                          width: 80,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Best Selling Section
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSelling.length,
                  itemBuilder: (context, index) {
                    final product = bestSelling[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                    width: double.infinity,
                                    height: media.height * 0.13,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return Center(
                                        child: Lottie.asset(
                                          'assets/lottie/threeDotsLottie.json',
                                          height: 80,
                                          width: 80,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
