import 'package:flutter/material.dart';
import 'package:quiz_app/screens/order_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text('C'),
              ),
              accountName: Text('Spurtel Corp'),
              accountEmail: Text('centurionconfidence@gmail.com'),
            ),
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
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
