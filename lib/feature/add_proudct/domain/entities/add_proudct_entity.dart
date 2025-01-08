import 'dart:io';

class AddProudctEntity {
  final String name;
  final String description;
  final double price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;

  AddProudctEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });
}
