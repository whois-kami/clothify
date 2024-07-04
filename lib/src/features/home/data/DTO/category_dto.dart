class CategoryDTO {
  String? title;
  String? productsId;
  String? imageUrl;

  CategoryDTO({
    this.title,
    this.productsId,
    this.imageUrl,
  });

  CategoryDTO.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String? ?? '';
    productsId = json['productsId'] as String? ?? '';
    imageUrl = json['image'] as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['productsId'] = productsId;
    data['image'] = imageUrl;
    return data;
  }
}
