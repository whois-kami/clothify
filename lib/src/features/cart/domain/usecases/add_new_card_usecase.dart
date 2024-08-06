import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewCardUsecase {
  final CartRepository cartRepository;
  AddNewCardUsecase({
    required this.cartRepository,
  });

  Future<void> execute({required CardEntity card}) async {
    await cartRepository.addNewCard(card: card);
  }
}
