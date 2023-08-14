import 'package:flutter/material.dart';
import 'package:isar_basic/components/alert.dart';
import 'package:isar_basic/models/product.dart';
import 'package:isar_basic/services/db_services.dart';

class UserPageController extends ChangeNotifier {
  BuildContext context;

  List<Product> productsList = [];
  UserPageController(this.context);

  void onLoad() {
    getProductsList();
  }

  Future<void> getProductsList() async {
    try {
      productsList = await DBServices.getProductList();
      notifyListeners();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }
}
