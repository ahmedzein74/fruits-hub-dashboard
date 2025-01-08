import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_entity.dart';

class AddProudctInputModel {
  final String name;
  final String description;
  final double price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;

  AddProudctInputModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.code,
      required this.isFeatured,
      this.imageUrl});

  factory AddProudctInputModel.fromEntity(AddProudctEntity entity) =>
      AddProudctInputModel(
          name: entity.name,
          description: entity.description,
          price: entity.price,
          image: entity.image,
          code: entity.code,
          isFeatured: entity.isFeatured,
          imageUrl: entity.imageUrl);

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl
    };
  }
}
