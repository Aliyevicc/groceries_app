import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../common/provider/favourite_provider/favourite_provider.dart';
import '../../common/provider/products_model/provider_model.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final List<Product> favoriteItems = favoritesProvider.favoriteItems;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favoriteItems.isEmpty
          ? _buildEmptyFavorites()
          : _buildFavoritesList(context, favoritesProvider, favoriteItems),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: 100,
          ),
          const SizedBox(height: 20),
          Text(
            'No favorite items yet!',
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Start adding your favorite products.',
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(BuildContext context,
      FavoritesProvider favoritesProvider, List<Product> favoriteItems) {
    var media = MediaQuery.of(context).size;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final product = favoriteItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
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
                title: Text(
                  product.name,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.green.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: () {
                    favoritesProvider.removeFromFavorites(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: TColor.primary,
                        content: Text(
                          '${product.name} removed from favorites!',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
