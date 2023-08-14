// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/components/cart_item.dart';
import 'package:isar_basic/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, con, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Checkout"),
          ),
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: con.itemCount,
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: con.carts[index],
                      onDelete: () => con.removeItem(con.carts[index]),
                    );
                  },
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(16),
                color: Colors.indigo[100],
                child: Row(
                  children: [
                    Text("X ${con.itemCount}"),
                    Spacer(),
                    Text("Total : ${con.getTotalPrice()}"),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          con.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Pay complete cart clear')));
                        },
                        child: Text('Pay'))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
