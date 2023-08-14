import 'package:flutter/material.dart';
import 'package:isar_basic/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> carts = [];

  void addItem(Product item) {
    carts.add(item);
    notifyListeners();
  }

  void removeItem(Product p) {
    carts.remove(p);
    notifyListeners();
  }

  double getTotalPrice() {
    double sum = 0;
    for (Product p in carts) {
      sum += p.price;
    }
    return sum;
  }

  void clear() {
    carts.clear();
    notifyListeners();
  }

  int get itemCount => carts.length;
}
