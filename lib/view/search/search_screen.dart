import 'package:flutter/material.dart';
import 'package:groceries/main.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:groceries/view/search/category_screen.dart';
import 'package:lottie/lottie.dart';
import '../../common/products/products_map.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  void searchProducts(String query) {
    List<Map<String, dynamic>> allProducts = [];

    products.forEach((key, value) {
      allProducts.addAll(value);
    });

    List<Map<String, dynamic>> filteredProducts = allProducts
        .where((product) =>
            product['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      searchResults = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        title: const Text(
          "Find products",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F3F2),
                    hintText: "Search Store",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                searchResults.clear();
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: (text) {
                    searchProducts(text);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                _searchController.text.isNotEmpty
                    ? searchResults.isNotEmpty
                        ? Column(
                            children: List.generate(
                              searchResults.length,
                              (index) => ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        imageUrl: searchResults[index]['image'],
                                        name: searchResults[index]['name'],
                                        weight: searchResults[index]['weight'],
                                        description: searchResults[index]
                                            ['description'],
                                        price: searchResults[index]['price']
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                    searchResults[index]['image'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child; // Image is loaded
                                      } else {
                                        return Lottie.asset(
                                          'assets/lottie/threeDotsLottie.json',
                                          width: 50,
                                          height: 50,
                                        );
                                      }
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                title: Text(searchResults[index]['name']),
                                subtitle:
                                    Text(searchResults[index]['description']),
                                trailing: Text(
                                    '\$${searchResults[index]['price'].toString()}'),
                              ),
                            ),
                          )
                        : const Text(
                            'No results found',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                    : Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                              categoryName: 'Fruits'),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5, // Dinamik bo'y
                                  width: screenWidth * 0.4, // Dinamik kenglik
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF53B175)
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(19),
                                    border: Border.all(
                                      color: const Color(0xFF53B175),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      Image.asset(
                                        'assets/categories/vegatables.png',
                                        width: screenWidth * 0.3, // Dinamik
                                      ),
                                      const Text(
                                        "Fresh Fruits \n&Vegetables",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                        categoryName: 'Cooking Oil & Ghee',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8A44C)
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(19),
                                    border: Border.all(
                                      color: const Color(0xFFF8A44C),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 18),
                                      Image.asset(
                                        'assets/categories/cooking.png',
                                        width: screenWidth * 0.3,
                                      ),
                                      const Text(
                                        "Cooking oil\n    &Ghee",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                        categoryName: 'Meat',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: const Color(0x0ff7a593)
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                        color: const Color(0xFFF7A593),
                                      )),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        'assets/categories/meat.png',
                                        width: screenWidth * 0.3,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Meat & Fish",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                        categoryName: 'Bakery',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD3B0E0)
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                        color: const Color(0xFFD3B0E0),
                                      )),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        'assets/categories/bakery.png',
                                        width: screenWidth * 0.3,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Bakery & Snacks",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                        categoryName: 'Dairy & Eggs',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFDE598)
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                        color: const Color(0xFFFDE598),
                                      )),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        'assets/categories/jalab.png',
                                        width: screenWidth * 0.3,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Dairy & Eggs",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(
                                        categoryName: 'Beverages',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEAB5B5)
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                        color: const Color(0xFFEAB5B5),
                                      )),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        'assets/categories/last.png',
                                        width: screenWidth * 0.3,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Beverages",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
