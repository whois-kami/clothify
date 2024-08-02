class CartItemDTO {
  int? id;
  String? title;
  String? color;
  String? imageUrl;
  int? price;
  int? count;
  CartItemDTO({
    this.title,
    this.color,
    this.imageUrl,
    this.count,
  });

  CartItemDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int? ?? 0;
    title = json['title'] as String? ?? '';
    color = json['color'] as String? ?? '';
    imageUrl = json['image'] as String? ?? '';
    price = json['price'] as int? ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    data['image'] = imageUrl;
    data['price'] = price;

    return data;
  }
}
