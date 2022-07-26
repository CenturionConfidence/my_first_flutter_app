import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/order_provider.dart';

import '../provider/carts_provider.dart';
import '../widget/cart_design.dart' as cartItem;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${data.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(10),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(
                      //   OrderScreen.routeName,
                      // );
                      Provider.of<OrderList>(context, listen: false).addOrder(
                        data.items.values.toList(),
                        data.totalAmount,
                      );
                      data.clearCart();
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (_, index) => cartItem.CartItem(
                data.items.values.toList()[index].id,
                data.items.keys.toList()[index],
                data.items.values.toList()[index].price,
                data.items.values.toList()[index].quantity,
                data.items.values.toList()[index].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
