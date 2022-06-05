
// ignore_for_file: non_constant_identifier_names

class HouseEntity {
  final num id;
  final String name;
  final String description;
  final String type;
  final num rating;
  final num review_count;
  late final List<String>? images;
  final num price;
  HouseEntity(this.images,
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.rating,
      required this.review_count,
      required this.price});
}
