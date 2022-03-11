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
    required this.colors,
    required this.year,
    required this.brand,
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    final images = <String>[];
    if (json['images'] != null) {
      json['images'].forEach((image) {
        images.add(image);
      });
    }
    final colors = <String>[];
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
      colors: colors,
      year: json['year'],
      brand: json['brand'],
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
    data['colors'] = colors;
    data['year'] = year;
    data['brand'] = brand;
    return data;
  }

  final String id;
  final String name;
  final String brand;
  final String description;
  final String category;
  final num price;
  final String thubmnail;
  final List<String> images;
  final String size;
  final List<String> colors;
  final num year;
}
