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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'weight': weight,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      description: map['description'],
      weight: map['weight'],
      image: map['image'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.weight == weight &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    price.hashCode ^
    description.hashCode ^
    weight.hashCode ^
    image.hashCode;
  }
}
