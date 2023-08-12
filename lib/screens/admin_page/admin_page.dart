// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/components/add_product_overlay.dart';
import 'package:isar_basic/components/product_widget.dart';
import 'package:isar_basic/models/product.dart';
import 'package:isar_basic/screens/admin_page/admin_page.controller.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late AdminPageController controller;

  @override
  void initState() {
    controller = AdminPageController(context);
    controller.getProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminPageController>(
      create: (context) => controller,
      child: Consumer<AdminPageController>(
        builder: (
          context,
          con,
          child,
        ) {
          return Scaffold(
            backgroundColor: Colors.blue[900],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddProductOverlay(
                      onSubmit: (p) {
                        con.createProduct(p);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0,
              title: Text("Admin Page"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: con.productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(
                    product: con.productsList[index],
                    onDelete: () {
                      con.deleteProduct(con.productsList[index]);
                    },
                    onUpdate: () {
                      Product updated = con.productsList[index];

                      // updated.name = "";
                      // updated.description = "";
                      // updated.price = 19900;

                      updated
                        ..name = "iPad Air"
                        ..description = "This is iPad Air"
                        ..price = 19900;
                      con.updateProduct(updated);
                    },
                    isAdmin: true,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
