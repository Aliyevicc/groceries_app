import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/common/provider/model/provider_model.dart';
import 'package:groceries/view/detail/detail_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../common/products/products_map.dart';
import '../../common/provider/products_provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryProducts = products[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: (){
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
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
            child: Container(
              margin: const EdgeInsets.all(10),
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.network(
                            product.image,
                            fit: BoxFit.cover,
                            width: 140,
                            height: 130,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: Lottie.asset(
                                    'assets/lottie/threeDotsLottie.json',
                                    height: 80,
                                    width: 80,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          product.weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${product.price.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
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
                              Provider.of<CartProvider>(context, listen: false)
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
    );
  }
}
