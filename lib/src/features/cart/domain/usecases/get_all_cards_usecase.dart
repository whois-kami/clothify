import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCardsUsecase {
  final CartRepository cartRepository;
  GetAllCardsUsecase({
    required this.cartRepository,
  });

  Future<List<CardEntity>> execute() async {
    return await cartRepository.getAllCards();
  }
}
