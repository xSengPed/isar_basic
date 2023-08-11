// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/screens/admin_page/admin_page.dart';

class MainMenuController extends ChangeNotifier {
  BuildContext context;
  MainMenuController(this.context);

  void goToAdmin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminPage(),
        ));
  }
}
