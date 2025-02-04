class ReviewEntity {
  final String name;
  final String image;
  final String date;
  final num rating;
  final String reviewDescription;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.date,
      required this.rating,
      required this.reviewDescription});
}
