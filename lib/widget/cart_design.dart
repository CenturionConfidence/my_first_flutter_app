import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/carts_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(this.productId, this.id, this.price, this.quantity, this.title,
      {Key? key})
      : super(key: key);

  final String id;
  final String title;
  final int quantity;
  final double price;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartList>(context);
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Item?'),
            content: const Text(
                'Are you sure you want to remove this item from the cart?'),
            actions: [
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        data.removeItem(id);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text('$quantity x'),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text(
              '\$$price',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
