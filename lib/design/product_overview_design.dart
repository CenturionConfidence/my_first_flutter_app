import 'package:flutter/material.dart';

class ProductDesign extends StatelessWidget {
  const ProductDesign(this.imageUrl, this.price, this.title, {Key? key})
      : super(key: key);

  final String title;
  final double price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
      footer: GridTileBar(
        backgroundColor: const Color.fromARGB(141, 0, 0, 0),
        title: Text(title),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
      header: GridTileBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        title: Container(
          alignment: Alignment.topRight,
          child: Chip(
            label: Text('\$$price'),
          ),
        ),
      ),
    );
  }
}
