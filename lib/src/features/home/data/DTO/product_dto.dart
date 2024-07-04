// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDto {
  String? title;
  String? manufacturer;
  List<dynamic>? tags;
  String? color;
  int? views;
  String? imageUrl;
  int? price;

  ProductDto({
    this.title,
    this.manufacturer,
    this.tags,
    this.color,
    this.views,
    this.imageUrl,
  });

  ProductDto.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String? ?? '';
    manufacturer = json['manufacturer'] as String? ?? '';
    tags = json['tags'] as List<dynamic>? ?? [];
    color = json['color'] as String? ?? '';
    views = json['views'] as int? ?? 0;
    imageUrl = json['image'] as String? ?? '';
    price = json['price'] as int? ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
