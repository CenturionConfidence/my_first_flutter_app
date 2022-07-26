import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/widget/manage_product_design.dart';
import 'package:quiz_app/provider/products.dart';
import 'package:quiz_app/main_drawer.dart';
import 'package:quiz_app/screens/edit_product_screen.dart';

class ManageProduct extends StatelessWidget {
  const ManageProduct({Key? key}) : super(key: key);

  static const routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Product'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: products.items.length,
        itemBuilder: ((_, i) => ManageProductDesign(products.items[i])),
      ),
    );
  }
}
