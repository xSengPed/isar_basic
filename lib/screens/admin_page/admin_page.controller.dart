import 'package:flutter/material.dart';
import 'package:isar_basic/components/alert.dart';
import 'package:isar_basic/models/product.dart';
import 'package:isar_basic/services/db_services.dart';

class AdminPageController extends ChangeNotifier {
  BuildContext context;
  AdminPageController(this.context);

  List<Product> productsList = [];

  Future<void> getProductsList() async {
    productsList = await DBServices.getProductList();
    notifyListeners();
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
      Alert.showErrorAlert(context, err: e as Map);
    }
  }

  Future<void> deleteProduct(Product product) async {
    await DBServices.deleteProduct(product);
    getProductsList();
  }
}
