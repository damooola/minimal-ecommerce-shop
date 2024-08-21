import 'package:flutter/material.dart';
import 'package:miniecommerceapp/models/shop.dart';
import 'package:miniecommerceapp/pages/cart_page.dart';
import 'package:miniecommerceapp/pages/settings_page.dart';
import 'package:miniecommerceapp/pages/shop_page.dart';
import 'package:miniecommerceapp/themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(ChangeNotifierProvider<Shop>(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lighMode,
      routes: {
        "/intro_page": (context) => const IntroPage(),
        "/shop_page": (context) => const ShopPage(),
        "/cart_page": (context) => const CartPage(),
        "/settings_page": (context) => const SettingsPage()
      },
    );
  }
}
