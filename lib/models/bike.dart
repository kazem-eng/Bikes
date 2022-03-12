import 'package:json_annotation/json_annotation.dart';

part 'bike.g.dart';

@JsonSerializable()
class Bike {
  Bike({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.thubmnail,
    required this.images,
    required this.size,
    required this.year,
    required this.brand,
  });

  factory Bike.fromJson(Map<String, dynamic> json) => _$BikeFromJson(json);

  Map<String, dynamic> toJson() => _$BikeToJson(this);

  final String id;
  final String name;
  final String brand;
  final String description;
  final String category;
  final num price;
  final String thubmnail;
  final List<String> images;
  final String size;
  final num year;
}
