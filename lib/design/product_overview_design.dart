import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/products.dart';
import 'package:quiz_app/screens/product_detail_screen.dart';

class ProductDesign extends StatelessWidget {
  const ProductDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetail.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          ),
        ),
        header: GridTileBar(
          leading: IconButton(
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
          title: Container(
            alignment: Alignment.topRight,
            child: Chip(
              label: Text('\$$product.price'),
            ),
          ),
        ),
      ),
    );
  }
}
