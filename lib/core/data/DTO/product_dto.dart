// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDto {
  int? id;
  String? title;
  String? manufacturer;
  List<dynamic>? tags;
  String? color;
  int? views;
  String? imageUrl;
  int? price;
  bool? isFavorite;

  ProductDto({
    this.id,
    this.title,
    this.manufacturer,
    this.tags,
    this.color,
    this.views,
    this.imageUrl,
    this.isFavorite,
  });

  ProductDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int? ?? 0;
    title = json['title'] as String? ?? '';
    manufacturer = json['manufacturer'] as String? ?? '';
    tags = json['tags'] as List<dynamic>? ?? [];
    color = json['color'] as String? ?? '';
    views = json['views'] as int? ?? 0;
    imageUrl = json['image'] as String? ?? '';
    price = json['price'] as int? ?? 0;
    isFavorite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['manufacturer'] = manufacturer;
    data['tags'] = tags;
    data['color'] = color;
    data['views'] = views;
    data['image'] = imageUrl;
    data['price'] = price;
    return data;
  }
}
