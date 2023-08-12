import 'package:flutter/material.dart';
import 'package:isar_basic/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;
  final bool isAdmin;
  const ProductWidget({
    super.key,
    required this.product,
    this.isAdmin = false,
    this.onDelete,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(product.description),
            const Spacer(),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Price : ${product.price.toString()}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: isAdmin,
              child: Row(
                children: [
                  TextButton(onPressed: onUpdate, child: const Text('Update')),
                  const Spacer(),
                  GestureDetector(
                    onTap: onDelete,
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
