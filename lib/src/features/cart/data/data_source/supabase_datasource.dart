import 'dart:convert';
import 'dart:developer';

import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/services/encrypt_decrypt.dart';
import 'package:ecom_app/core/services/generate_random_order_uid.dart';
import 'package:ecom_app/src/features/cart/data/DTO/card_dto.dart';
import 'package:ecom_app/src/features/cart/data/DTO/cart_item_dto.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseCartDatasource {
  final SupabaseClient supabase;
  final SharedPreferences preferences;
  final FlutterSecureStorage secureStorage;
  final EncryptionService encryptionService;

  SupabaseCartDatasource({
    required this.supabase,
    required this.preferences,
    required this.secureStorage,
    required this.encryptionService,
  });

  Future<List<CartItemDTO>> getAllCartItems() async {
    final prefs = getIt<SharedPreferences>();
    final String? items = prefs.getString('shopping_cart');

    if (items == null || items == '') return [];

    Map<String, dynamic> shoppingItems = jsonDecode(items);

    List<int> ids = shoppingItems.keys
        .map((key) => int.tryParse(key.split('_')[1])!)
        .toList();

    final productsData = await supabase
        .from('products')
        .select('id, title, color, image, price')
        .inFilter('id', ids);

    if (productsData.isEmpty) {
      return [];
    }

    List<CartItemDTO> cartItemsDTO = (productsData as List<dynamic>).map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final CartItemDTO product = CartItemDTO.fromJson(productData);

      int productId = productData['id'] as int;
      product.count = shoppingItems['item_$productId'] ?? 0;

      return product;
    }).toList();

    return cartItemsDTO;
  }

  Future<List<CardDto>> addNewCard({
    required CardEntity card,
  }) async {
    try {
      await encryptionService.init();
      final uUID = supabase.auth.currentUser!.id;

      final encryptedCard = CardEntity(
        cardNubmer: encryptionService.encryptData(card.cardNubmer),
        cardHolderName: encryptionService.encryptData(card.cardHolderName),
        cardExpired: encryptionService.encryptData(card.cardExpired),
        cardCvvCode: encryptionService.encryptData(card.cardCvvCode),
      );

      final response = await supabase
          .from('profiles')
          .select('payment_methods')
          .eq('UID', uUID)
          .single();

      List<dynamic> paymentMethods = response['payment_methods'] ?? [];
      paymentMethods.add({
        'cardNubmer': encryptedCard.cardNubmer,
        'cardHolderName': encryptedCard.cardHolderName,
        'cardExpired': encryptedCard.cardExpired,
        'cardCvvCode': encryptedCard.cardCvvCode,
      });

      await supabase
          .from('profiles')
          .update({'payment_methods': paymentMethods}).eq('UID', uUID);

      final updatedResponse = await supabase
          .from('profiles')
          .select('payment_methods')
          .eq('UID', uUID)
          .single();

      return (updatedResponse['payment_methods'] as List<dynamic>)
          .map((cardData) {
        return CardDto(
          cardNubmer: cardData['cardNubmer'],
          cardHolderName: cardData['cardHolderName'],
          cardExpired: cardData['cardExpired'],
          cardCvvCode: cardData['cardCvvCode'],
        );
      }).toList();
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<void> makeOrder({required OrderEntity order}) async {
    final prefs = getIt<SharedPreferences>();
    final uUID = supabase.auth.currentUser!.id;
    final response = await supabase
        .from('profiles')
        .select('orders_status')
        .eq('UID', uUID)
        .single();

    List<dynamic> ordersStatus = response['orders_status'] ?? [];

    String uniqueOrderId = generateOrderId();

    List<Map<String, dynamic>> productsList = order.items.map((el) {
      return {
        'count': el.count,
        'color': el.color,
        'title': el.title,
        'price': el.price,
        'status': 'On Progress',
      };
    }).toList();

    ordersStatus.add({
      uniqueOrderId: productsList,
    });

    await supabase
        .from('profiles')
        .update({'orders_status': ordersStatus}).eq('UID', uUID);

    await prefs.setString('shopping_cart', '');
  }

  

}
