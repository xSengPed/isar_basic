import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:isar_basic/models/product.dart';
import 'package:path_provider/path_provider.dart';

class DBServices {
  static Isar? isar;
  static Future<void> initDB() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [ProductSchema],
        directory: dir.path,
      );
    } catch (e) {
      log('ISAR Connection ERROR');
      log(e.toString());
    }
  }

  static createNewProduct(Product product) async {
    log(product.name);
    log(product.description);
    log(product.price.toString());
    try {
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().put(product);
      });

      log('Add Done');
    } catch (e) {
      log(e.toString());
    }
  }

  static getProductList() async {
    try {
      final productList = await isar?.collection<Product>().where().findAll();

      log(productList.toString());
      return productList;
    } catch (e) {}
  }
}
