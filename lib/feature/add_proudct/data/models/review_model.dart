import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final num rating;
  final String reviewDescription;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.rating,
      required this.reviewDescription});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) => ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      rating: reviewEntity.rating,
      reviewDescription: reviewEntity.reviewDescription);

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        name: json['name'],
        image: json['image'],
        date: json['date'],
        rating: json['rating'],
        reviewDescription: json['reviewDescription'],
      );
  toJson() => {
        'name': name,
        'image': image,
        'date': date,
        'rating': rating,
        'reviewDescription': reviewDescription
      };
}
