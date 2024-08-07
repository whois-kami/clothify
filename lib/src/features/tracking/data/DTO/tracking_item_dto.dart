// ignore_for_file: public_member_api_docs, sort_constructors_first
class TrackingItemDto {
  String? title;
  String? color;
  int? qty;
  String? imgUrl;
  String? status;
  int? price;
  TrackingItemDto({
    this.title,
    this.color,
    this.qty,
    this.imgUrl,
    this.status,
    this.price
  });

  TrackingItemDto.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String? ?? '';
    color = json['color'] as String? ?? '';
    qty = json['count'] as int? ?? 0;
    imgUrl = json['imgUrl'] as String? ?? '';
    status = json['status'] as String? ?? '';
    price = json['price'] as int? ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['color'] = color;
    data['count'] = qty;
    data['imgUrl'] = imgUrl;
    data['status'] = status;
    data['price'] = price;
    return data;
  }
}
