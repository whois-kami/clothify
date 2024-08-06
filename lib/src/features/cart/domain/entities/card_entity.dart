// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String cardNubmer;
  final String cardHolderName;
  final String cardExpired;
  final String  cardCvvCode;
  const CardEntity({
    required this.cardNubmer,
    required this.cardHolderName,
    required this.cardExpired,
    required this.cardCvvCode,
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
    String ? cardCvvCode,
  }) {
    return CardEntity(
      cardNubmer: cardNubmer ?? this.cardNubmer,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardExpired: cardExpired ?? this.cardExpired,
      cardCvvCode: cardCvvCode ?? this.cardCvvCode,
    );
  }
}
