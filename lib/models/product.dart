//a template of a product containing all properties

class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  const Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath});
}
