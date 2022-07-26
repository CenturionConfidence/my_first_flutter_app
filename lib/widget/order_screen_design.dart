import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/provider/order_provider.dart';

class OrderDesign extends StatefulWidget {
  const OrderDesign(this.order, {Key? key}) : super(key: key);

  final OrderItem order;

  @override
  State<OrderDesign> createState() => _OrderDesignState();
}

class _OrderDesignState extends State<OrderDesign> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount.toString()}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: widget.order.products.length * 20.0 + 10,
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          Text(
                            prod.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('${prod.quantity}x \$${prod.price}'),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
