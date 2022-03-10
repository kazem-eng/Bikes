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
    required this.color,
    required this.year,
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    final images = <String>[];
    if (json['images'] != null) {
      json['images'].forEach((image) {
        images.add(image);
      });
    }
    return Bike(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      thubmnail: json['thubmnail'],
      images: images,
      size: json['size'],
      color: json['color'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['thubmnail'] = thubmnail;
    data['images'] = images;
    data['size'] = size;
    data['color'] = color;
    data['year'] = year;
    return data;
  }

  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String thubmnail;
  final List<String> images;
  final int size;
  final String color;
  final int year;
}
