import 'package:flutter/material.dart';
import 'package:isar_basic/components/alert.dart';
import 'package:isar_basic/models/product.dart';
import 'package:isar_basic/services/db_services.dart';

class AdminPageController extends ChangeNotifier {
  BuildContext context;
  AdminPageController(this.context);

  List<Product> productsList = [];

  Future<void> getProductsList() async {
    try {
      productsList = await DBServices.getProductList();
      notifyListeners();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }

  Future<void> createProduct(Product product) async {
    await DBServices.createNewProduct(product);
    getProductsList();
  }

  Future<void> updateProduct(Product product) async {
    try {
      await DBServices.updateProduct(product);
      getProductsList();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }

  Future<void> deleteProduct(Product product) async {
    try {
      await DBServices.deleteProduct(product);
      getProductsList();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }
}
