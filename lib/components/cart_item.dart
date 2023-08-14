// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/models/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;
  const CartItem({super.key, required this.product, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text("${product.name}"),
            Spacer(),
            Text("${product.price}"),
            SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
