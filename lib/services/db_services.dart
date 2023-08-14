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
    try {
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().put(product);
      });
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "Create Product",
        "error_msg": "Failed To Create  Product",
      };
    }
  }

  static updateProduct(Product product) async {
    try {
      throw 100;
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().put(product);
      });
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "Update Product",
        "error_msg": "Failed To Update Product",
      };
    }
  }

  static Future<List<Product>> getProductList() async {
    try {
      // throw 100;
      final productList =
          await isar?.collection<Product>().where().findAll() ?? [];
      return productList;
    } catch (e) {
      throw {
        "code": 4000,
        "error_title": "Get Product",
        "error_msg": "Failed To Get All Product",
      };
    }
  }

  static Future<void> deleteProduct(Product product) async {
    try {
      throw 100;
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().delete(product.id);
      });
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "Delete Product",
        "error_msg": "Failed To Delete Product",
      };
    }
  }
}
