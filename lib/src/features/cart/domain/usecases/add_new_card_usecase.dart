import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewCardUsecase {
  final CartRepository cartRepository;
  AddNewCardUsecase({
    required this.cartRepository,
  });

  Future<List<CardEntity>> execute({required CardEntity card}) async {
   return await cartRepository.addNewCard(card: card);
  }
}
