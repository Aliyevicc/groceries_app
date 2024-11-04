import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:groceries/view/home/home_categories/Best_selling_section.dart';
import 'package:groceries/view/home/home_categories/Exclusive_offer_section.dart';
import 'package:groceries/view/home/home_categories/groceries_section.dart';
import 'package:groceries/view/home/home_categories/meat_section.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../common/connection/check_connection.dart';
import '../../common/geolocator/geolocator_settings.dart';
import '../../common/products/products_map.dart';

import '../../common/provider/products_model/provider_model.dart';
import '../../common/provider/products_provider/provider.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class HomeScreen extends StatefulWidget {
  final TabController? tabController;

  const HomeScreen({super.key, this.tabController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String? _currentCity;

  bool _isConnected = true;
  final ConnectionChecker _connectionChecker = ConnectionChecker();

  Future<void> checkConnection() async {
    _isConnected = await _connectionChecker.hasInternetConnection();

    if (!_isConnected) {
      _showNoConnectionDialog();
    }
    setState(() {});
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Internet ulanishi yo\'q'),
          content: const Text('Iltimos, internetga ulanganingizni tekshiring.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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

    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are you sure you want to exit?"),
            content: const Text("Do you really want to close the app?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Exit"),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:    Image.asset(
            "assets/images/red_carrot.png",
            width: media.width * 0.1,
            height: media.width * 0.1,
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
        ),
        backgroundColor: TColor.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
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
                      onTap: () {
                        widget.tabController?.animateTo(1);
                      },
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ExclusiveOfferSection(),

                const SizedBox(height: 20),

                // Best Selling Section
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const BestSellingSection(),

                const SizedBox(
                  height: 20,
                ),

//GROCERIES SECTION
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Groceries",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               const GroceriesSection(),
                const SizedBox(
                  height: 20,
                ),
//MEAT SECTION
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Meat and Fish",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const MeatSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
