// ignore_for_file: public_member_api_docs, sort_constructors_first

class CardDto {
  String? cardNubmer;
  String? cardHolderName;
  String? cardExpired;
  String? cardCvvCode;
  bool? selected;
  CardDto({
    this.cardNubmer,
    this.cardHolderName,
    this.cardExpired,
    this.cardCvvCode,
    this.selected,
  });

  CardDto.fromJson(Map<String, dynamic> json) {
    cardNubmer = json['cardNubmer'] as String? ?? '';
    cardHolderName = json['cardHolderName'] as String? ?? '';
    cardExpired = json['cardExpired'] as String? ?? '';
    cardCvvCode = json['cardCvvCode'] as String? ?? '';
    selected = json['selected'] as bool? ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardNubmer'] = cardNubmer;
    data['cardHolderName'] = cardHolderName;
    data['cardExpired'] = cardExpired;
    data['cardCvvCode'] = cardCvvCode;
    data['selected'] = selected;

    return data;
  }
}
