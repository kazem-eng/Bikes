class Bike {
  Bike({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.thubmnail,
    required this.images,
    required this.size,
    required this.color,
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    final images = <String>[];
    if (json['images'] != null) {
      json['images'].forEach((image) {
        images.add(image);
      });
    }
    return Bike(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      thubmnail: json['thubmnail'],
      images: images,
      size: json['size'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['thubmnail'] = thubmnail;
    data['images'] = images;
    data['size'] = size;
    data['color'] = color;
    return data;
  }

  final String name;
  final String description;
  final String category;
  final double price;
  final String thubmnail;
  final List<String> images;
  final int size;
  final String color;
}
