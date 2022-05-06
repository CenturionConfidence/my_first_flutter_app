import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main_drawer.dart';

import '../provider/order_provider.dart' show OrderList;
import '../design/order_screen_design.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => OrderDesign(
          orderData.orders.values.toList()[i],
        ),
      ),
    );
  }
}
