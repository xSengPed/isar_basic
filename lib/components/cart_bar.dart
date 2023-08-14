// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/providers/cart_provider.dart';
import 'package:isar_basic/screens/checkout_page/checkout_page.dart';
import 'package:provider/provider.dart';

class CartBar extends StatefulWidget {
  const CartBar({super.key});

  @override
  State<CartBar> createState() => _CartBarState();
}

class _CartBarState extends State<CartBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, con, child) {
      return Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        color: Colors.indigo[900],
        child: Row(
          children: [
            Icon(
              Icons.shopping_cart_checkout,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Text('X ${con.itemCount}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ));
              },
              child: Text('Checkout'),
            )
          ],
        ),
      );
    });
  }
}
