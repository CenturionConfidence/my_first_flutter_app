import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/provider/order_provider.dart';

class OrderDesign extends StatelessWidget {
  const OrderDesign(String string, DateTime dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final design = Provider.of<OrderItem>(context);

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Text('\$${design.amount.toString()}'),
            subtitle: Text(
              DateFormat('dd MM yyyy').format(design.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down),
            ),
          )
        ],
      ),
    );
  }
}
