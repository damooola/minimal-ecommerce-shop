import 'package:flutter/material.dart';
import 'package:miniecommerceapp/components/my_drawer.dart';
import 'package:miniecommerceapp/components/my_product_tile.dart';
import 'package:miniecommerceapp/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //can also use value.getShop() if you wrap with a consumer and created a getshop method that returns shop
    //initialise product list from Shop Model
    final products = context.watch<Shop>().shop;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            "Shop Page",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, "/cart_page"),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ))
          ],
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Colors.transparent,
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(height: 25),
            //subtitle
            Center(
              child: Text(
                "Choose from a wide range of premium products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            // product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
