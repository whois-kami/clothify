// ignore_for_file: public_member_api_docs, sort_constructors_first

class CardDto {
  String? cardNubmer;
  String? cardHolderName;
  String? cardExpired;
  String? cardCvvCode;
  CardDto({
    this.cardNubmer,
    this.cardHolderName,
    this.cardExpired,
    this.cardCvvCode,
  });

  CardDto.fromJson(Map<String, dynamic> json) {
    cardNubmer = json['cardNubmer'] as String? ?? '';
    cardHolderName = json['cardHolderName'] as String? ?? '';
    cardExpired = json['cardExpired'] as String? ?? '';
    cardCvvCode = json['cardCvvCode'] as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardNubmer'] = cardNubmer;
    data['cardHolderName'] = cardHolderName;
    data['cardExpired'] = cardExpired;
    data['cardCvvCode'] = cardCvvCode;

    return data;
  }
}
