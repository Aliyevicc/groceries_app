import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries/common/products/products_map.dart';
import 'package:groceries/common/style/color_extensions/color_extensions.dart';

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
                  Image.asset("assets/images/red_carrot.png",
                      width: media.width * 0.1,
                      height: media.width * 0.1),
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
              const SizedBox(
                height: 15,
              ),
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
                        fontSize:
                            media.width * 0.045,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                    height: media.height * 0.2,
                    width: media.width * 0.9,
                    child: Image.asset("assets/img/banner_top.png")),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
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
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              // Product List
              SizedBox(
                height: media.height * 0.29,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fruitProducts.length,
                    itemBuilder: (context, index) {
                      final product = fruitProducts[index];

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
                              // Display product image
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: SizedBox(
                                  height: media.height * 0.13,
                                  width: media.width * 0.6,
                                  child: Image.network(
                                    product['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      product['name'] ?? 'Unknown',
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: media.width *
                                            0.05,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      product['weight'],
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
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ' \$${product['price'].toString()}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    height: 47,
                                    minWidth: 42,
                                    color: TColor.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Image.asset(
                                        "assets/images/Vector (1).png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Best Selling",
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
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),

              SizedBox(
                height: media.height * 0.29,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fruitProducts.length,
                    itemBuilder: (context, index) {
                      final product = fruitProducts[index];

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
                                    product['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      product['name'] ?? 'Unknown',
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: media.width *
                                            0.05,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      product['weight'],
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
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ' \$${product['price'].toString()}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    height: 47,
                                    minWidth: 42,
                                    color: TColor.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Image.asset(
                                        "assets/images/Vector (1).png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
