import 'dart:convert';

List<Product> popularProductListFromJson(String val) => List<Product>.from(
  json.decode(val)['data'].map((product) => Product.popularProductFromJson(product))
);

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['product']['name'],
    description: data['product']['description'],
    images: List<String>.from(data['product']?['images']?.map((x) => x['url']) ?? []),
  );
}