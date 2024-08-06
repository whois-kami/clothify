// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/services/encrypt_decrypt.dart';
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final SupabaseCartDatasource supabaseCartDatasource;
  final EncryptionService encryptionService;
  const CartRepositoryImpl({
    required this.supabaseCartDatasource,
    required this.encryptionService,
  });

  @override
  Future<List<CartItemEntity>> getAllCartItems() async {
    final cartItemsDTO = await supabaseCartDatasource.getAllCartItems();
    final cartItemsEntity =
        cartItemsDTO.map((dto) => CartItemEntity.fromDTO(dto)).toList();
    return cartItemsEntity;
  }

  @override
  Future<List<CardEntity>> addNewCard({required CardEntity card}) async {
    final cardsDTO = await supabaseCartDatasource.addNewCard(card: card);

    final cards = cardsDTO.map((card) {
      final cardNumber = encryptionService.decryptData(card.cardNubmer!);
      final cardHolderName =
          encryptionService.decryptData(card.cardHolderName!);
      final cardExpired = encryptionService.decryptData(card.cardExpired!);
      final cardCvvCode =
          encryptionService.decryptData(card.cardCvvCode.toString());

      return CardEntity(
        cardNubmer: cardNumber,
        cardHolderName: cardHolderName,
        cardExpired: cardExpired,
        cardCvvCode: cardCvvCode ,
      );
    }).toList();

    return cards;
  }

  @override
  Future<void> makeOrder({required OrderEntity order}) async {
    await supabaseCartDatasource.makeOrder(order: order);
  }
}
