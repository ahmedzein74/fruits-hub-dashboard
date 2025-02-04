import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_proudct/data/models/review_model.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_input_entity.dart';

class AddProudctInputModel {
  final String name;
  final String description;
  final double price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final double expirationMonths;
  bool isOrganic = false;
  final double numberOfCategories;
  final double unitAmount;
  final double averageRating = 0;
  final double totalRatings = 0;
  final List<ReviewModel> reviews;

  AddProudctInputModel(
      {required this.name,
      required this.reviews,
      required this.expirationMonths,
      required this.numberOfCategories,
      required this.unitAmount,
      required this.description,
      required this.price,
      required this.image,
      required this.code,
      required this.isFeatured,
      this.imageUrl});

  factory AddProudctInputModel.fromEntity(AddProudctEntity entity) =>
      AddProudctInputModel(
        reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
        name: entity.name,
        description: entity.description,
        price: entity.price,
        image: entity.image,
        code: entity.code,
        isFeatured: entity.isFeatured,
        imageUrl: entity.imageUrl,
        expirationMonths: entity.expirationMonths,
        numberOfCategories: entity.numberOfcalories,
        unitAmount: entity.unitAmount,
      );

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCategories': numberOfCategories,
      'unitAmount': unitAmount,
      'averageRating': averageRating,
      'totalRatings': totalRatings,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
