import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/products.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  static const routeName = '/product-Detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductList>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  loadedProduct.title,
                  style: const TextStyle(
                    fontFamily: 'Anton',
                    fontSize: 30,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Chip(
                  labelPadding: const EdgeInsets.all(5),
                  label: Text(
                    '\$${loadedProduct.price}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              loadedProduct.description,
              style: const TextStyle(
                fontSize: 15,
              ),
              softWrap: true,
            ),
          ),
          const SizedBox(height: 10),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 10,
          //   ),
          //   child: Text(
          //     loadedProduct.description,
          //   ),
          // ),
        ],
      ),
    );
  }
}
