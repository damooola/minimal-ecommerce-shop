import 'package:flutter/material.dart';
import 'package:miniecommerceapp/components/my_button.dart';
import 'package:miniecommerceapp/models/product.dart';
import 'package:miniecommerceapp/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product cartItem) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  const Text("Do you want want remove this from your cart?"),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //cancel button
                      MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                        ),
                      ),

                      //yes button
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);

                          context.read<Shop>().removeFromCart(cartItem);
                        },
                        child: const Text(
                          "Yes",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));

    onPressedPayButton() {}
  }

  @override
  Widget build(BuildContext context) {
    //access the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your Cart is Empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get each item in the cart
                      final cartItem = cart[index];

                      // return cart tile

                      return ListTile(
                        title: Text(cartItem.name),
                        subtitle:
                            Text("\$${cartItem.price.toStringAsFixed(2)}"),
                        trailing: IconButton(
                            onPressed: () =>
                                removeItemFromCart(context, cartItem),
                            icon: const Icon(Icons.remove)),
                      );
                    }),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyButton(onTap: () {}, child: const Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
