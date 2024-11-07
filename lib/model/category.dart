import 'dart:convert';

List<Category> popularCategoryListFromJson(String val) => List<Category>.from(
  json.decode(val)['data'].map((category) => Category.popularCategoryFromJson(category))
);

class Category {
  final int id;
  final String name;
  final String images;

  Category({
    required this.id,
    required this.name,
    required this.images,
  });

  factory Category.popularCategoryFromJson(Map<String, dynamic> data) => Category(
    id: data['id'],
    name: data['category']['name'],
    images: data['category']['images']['url'], // Adjusted path for images
  );
}