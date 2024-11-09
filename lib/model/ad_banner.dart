import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<AdBanner> AdBannerListFromJson(String val) => List<AdBanner>.from(
  json.decode(val)['data'].map((banner)=>AdBanner.fromJson(banner))
);


@HiveType(typeId: 1)

class AdBanner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String images;

  AdBanner({
    required this.id,
    required this.images
  });

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
    id: data['id'],
    images: data['images']['url']
  );
}