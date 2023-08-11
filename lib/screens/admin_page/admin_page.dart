// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/components/add_product_overlay.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddProductOverlay();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
    );
  }
}
