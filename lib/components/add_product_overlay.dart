// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:isar_basic/models/product.dart';

class AddProductOverlay extends StatefulWidget {
  final Function(Product)? onSubmit;
  const AddProductOverlay({super.key, this.onSubmit});

  @override
  State<AddProductOverlay> createState() => _AddProductOverlayState();
}

class _AddProductOverlayState extends State<AddProductOverlay> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: textFieldDeco,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "Please Enter Product Name";
                }
              },
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: descController,
              decoration: textFieldDeco,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "Please Enter Product Desc";
                }
              },
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
                  validator: (value) {},
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
                              if (formKey.currentState!.validate()) {
                                if (widget.onSubmit != null) {
                                  widget.onSubmit!(Product(
                                    name: nameController.text,
                                    description: descController.text,
                                    price: double.parse(priceController.text),
                                  ));
                                } else {
                                  return;
                                }
                              }
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
