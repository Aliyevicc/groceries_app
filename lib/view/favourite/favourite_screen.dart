import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/provider/favourite_provider/favourite_provider.dart';
import '../../common/provider/model/provider_model.dart';
import '../../common/style/color_extensions/color_extensions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final List<Product> favoriteItems = favoritesProvider.favoriteItems;

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
          ? Center(
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
      )
          : ListView.builder(
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
                    child: Image.network(
                      product.image,
                      width: media.width * 0.2,
                      height: media.width * 0.2,
                      fit: BoxFit.cover,
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
      ),
    );
  }
}
