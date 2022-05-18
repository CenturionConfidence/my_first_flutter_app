import 'package:flutter/material.dart';
import 'package:quiz_app/screens/manage_product_screen.dart';
import 'package:quiz_app/screens/order_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.shop),
                  title: const Text('My Shop'),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('My Orders'),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(OrderScreen.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Manage Products'),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ManageProduct.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
