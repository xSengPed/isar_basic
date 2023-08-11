// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isar_basic/models/product.dart';
import 'package:isar_basic/services/db_services.dart';

class AddProductOverlay extends StatefulWidget {
  const AddProductOverlay({super.key});

  @override
  State<AddProductOverlay> createState() => _AddProductOverlayState();
}

class _AddProductOverlayState extends State<AddProductOverlay> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  InputDecoration textFieldDeco = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  void initState() {
    log('show overlay');
    super.initState();
  }

  @override
  void dispose() {
    log('close overlay');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: textFieldDeco,
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: descController,
              decoration: textFieldDeco,
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Spacer(),
                Flexible(
                    child: TextFormField(
                  controller: priceController,
                  decoration: textFieldDeco,
                )),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () async {
                              await DBServices.createNewProduct(Product(
                                name: nameController.text,
                                description: descController.text,
                                price: double.parse(priceController.text),
                              ));

                              // await DBServices.getProductList();
                            },
                            child: Text("Add To Store")))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
