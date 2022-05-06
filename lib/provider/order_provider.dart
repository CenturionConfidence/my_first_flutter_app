import 'package:flutter/material.dart';

import 'carts_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.id,
  });
}

class OrderList with ChangeNotifier {
  final Map<String, OrderItem> _orders = {};

  Map<String, OrderItem> get orders {
    return {..._orders};
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.putIfAbsent(
      DateTime.now().toString(),
      () => OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
