// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/components/cart_bar.dart';
import 'package:isar_basic/components/product_widget.dart';
import 'package:isar_basic/providers/cart_provider.dart';
import 'package:isar_basic/screens/user_page/user_page.controller.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserPageController controller;
  late CartProvider cartProvider;

  @override
  void initState() {
    cartProvider = Provider.of(context, listen: false);
    controller = UserPageController(context);
    controller.onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<UserPageController>(
        builder: (context, con, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('User Page'),
            ),
            body: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: con.productsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductWidget(
                        product: con.productsList[index],
                        onAddToCart: () =>
                            cartProvider.addItem(con.productsList[index]),
                      );
                    },
                  ),
                ),
                CartBar()
              ],
            ),
          );
        },
      ),
    );
  }
}
