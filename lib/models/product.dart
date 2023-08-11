import 'package:isar/isar.dart';
part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  String name;
  String description;
  double price;

  Product({
    this.name = "",
    this.description = "",
    this.price = 0.0,
  });
}
