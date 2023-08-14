// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_basic/screens/main_menu/main_menu.controller.dart';
import 'package:isar_basic/screens/user_page/user_page.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late MainMenuController controller;

  @override
  void initState() {
    controller = MainMenuController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainMenuController>(
      create: (context) => controller,
      child: Consumer<MainMenuController>(builder: (
        context,
        con,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Main Menu"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: con.goToAdmin,
                child: Text("To Admin "),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(),
                        ));
                  },
                  child: Text("To User")),
            ],
          )),
        );
      }),
    );
  }
}
