import 'package:flutter/material.dart';
import 'package:isar_basic/providers/cart_provider.dart';
import 'package:isar_basic/screens/main_menu/main_menu.dart';
import 'package:isar_basic/services/db_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBServices.initDB();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainMenu(),
      ),
    );
  }
}
