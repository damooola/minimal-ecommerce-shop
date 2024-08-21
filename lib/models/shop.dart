import 'package:flutter/material.dart';
import 'package:miniecommerceapp/models/product.dart';

class Shop extends ChangeNotifier {
  // product for sale
  final List<Product> _shop = [
    const Product(
        name: "Arsenal",
        price: 99.99,
        description:
            "A striking red and white design, this jersey features clean lines and a modern aesthetic, embodying the spirit and tradition of the club.",
        imagePath: "images/arsenal.png"),
    const Product(
        name: "Barcelona",
        price: 89.99,
        description:
            "This iconic jersey showcases the classic blue and maroon stripes, symbolizing the rich heritage and vibrant culture of the team.",
        imagePath: "images/barca.png"),
    const Product(
        name: "Liverpool",
        price: 99.99,
        description:
            "With its bold red color and sleek design, this jersey represents the passion and pride of Liverpool, making a statement on and off the pitch.",
        imagePath: "images/liverpool.png"),
    const Product(
        name: "AC Milan",
        price: 79.99,
        description:
            "Featuring the legendary red and black stripes, this jersey combines elegance and power, reflecting the storied history and fierce identity of AC Milan.",
        imagePath: "images/milan.png"),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
