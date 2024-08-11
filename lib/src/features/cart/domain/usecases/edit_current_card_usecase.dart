import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditCurrentCardUsecase {
  final CartRepository cartRepository;
  EditCurrentCardUsecase({
    required this.cartRepository,
  });

  Future<List<CardEntity>> execute({required String cardNumber}) async {
    return await cartRepository.editCurrentCard(cardNumber: cardNumber);
  }
}
