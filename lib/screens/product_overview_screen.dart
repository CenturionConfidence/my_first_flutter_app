import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../design/product_overview_design.dart';
import '../provider/products.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductList>(context);
    final products = productData.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only show Favourites'),
                value: FilterOptions.favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (value) {
              if (value == FilterOptions.favorites) {
                productData.showFavoritesOnly();
              } else {
                productData.showAll();
              }
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Consumer(
        builder: (ctx, productData, _) => Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
            ),
            itemBuilder: ((context, i) => ChangeNotifierProvider.value(
                  value: products[i],
                  child: const ProductDesign(),
                )),
          ),
        ),
      ),
    );
  }
}
