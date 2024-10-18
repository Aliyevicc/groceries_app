class Product {
  final String name;
  final double price;
  final String description;
  final String weight;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.weight,
    required this.image,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
