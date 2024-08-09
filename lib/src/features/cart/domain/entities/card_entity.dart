// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String cardNubmer;
  final String cardHolderName;
  final String cardExpired;
  final String cardCvvCode;
  final bool selected;
  const CardEntity({
    required this.cardNubmer,
    required this.cardHolderName,
    required this.cardExpired,
    required this.cardCvvCode,
    required this.selected,
  });

  @override
  List<Object?> get props => [
        cardNubmer,
        cardExpired,
        cardHolderName,
        cardCvvCode,
      ];

  CardEntity copyWith({
    String? cardNubmer,
    String? cardHolderName,
    String? cardExpired,
    String? cardCvvCode,
    bool? selected,
  }) {
    return CardEntity(
      cardNubmer: cardNubmer ?? this.cardNubmer,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardExpired: cardExpired ?? this.cardExpired,
      cardCvvCode: cardCvvCode ?? this.cardCvvCode,
      selected: selected ?? this.selected,
    );
  }
}
