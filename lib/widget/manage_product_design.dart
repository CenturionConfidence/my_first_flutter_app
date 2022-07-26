import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/products.dart';
import 'package:quiz_app/screens/edit_product_screen.dart';

class ManageProductDesign extends StatelessWidget {
  const ManageProductDesign(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          title: Text(product.title),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditProductScreen.routeName,
                        arguments: product.id);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    Provider.of<ProductList>(context, listen: false)
                        .deleteProduct(product.id);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
