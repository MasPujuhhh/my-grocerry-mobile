import 'dart:convert';

import 'package:my_groceery_mobile/model/tag.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(
  json.decode(val)['data'].map((product) => Product.popularProductFromJson(product))
);

List<Product> productListFromJson(String val) => List<Product>.from(
  json.decode(val)['data'].map((product) => Product.productFromJson(product))
);

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> images;
  final List<Tag> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.tags,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['product']['name'],
    description: data['product']['description'],
    images: List<String>.from(data['product']?['images']?.map((x) => x['url']) ?? []),
    tags: []
  );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['name'],
    description: data['description'],
    images: List<String>.from(data['images']?.map((x) => x['url']) ?? []),
    tags: List<Tag>.from(data['tags']?.map((x) =>Tag.fromJson(x))),
  );
}