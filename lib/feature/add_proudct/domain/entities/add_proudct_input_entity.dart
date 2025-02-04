import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/review_entity.dart';

class AddProudctEntity {
  final String name;
  final String description;
  final double price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final double expirationMonths;
  final bool isOrganic;
  final double numberOfcalories;
  final double unitAmount;
  final double averageRating = 0;
  final double totalRatings = 0;
  final List<ReviewEntity> reviews;

  AddProudctEntity({
    required this.reviews,
    required this.name,
    required this.code,
    required this.expirationMonths,
    required this.numberOfcalories,
    required this.unitAmount,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    this.imageUrl,
  });
}
