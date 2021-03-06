import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/carts_provider.dart';
import 'package:quiz_app/provider/order_provider.dart';
import 'package:quiz_app/provider/products.dart';
import 'package:quiz_app/screens/Cart_screen.dart';
import 'package:quiz_app/screens/edit_product_screen.dart';
import 'package:quiz_app/screens/manage_product_screen.dart';
import 'package:quiz_app/screens/order_screen.dart';

import '../screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductList(),
        ),
        ChangeNotifierProvider.value(
          value: CartList(),
        ),
        ChangeNotifierProvider.value(
          value: OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrangeAccent,
          ),
          fontFamily: 'Lato',
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetail.routeName: (ctx) => const ProductDetail(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          ManageProduct.routeName: (ctx) => const ManageProduct(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
