// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final SupabaseCartDatasource supabaseCartDatasource;
  const CartRepositoryImpl({
    required this.supabaseCartDatasource,
  });

  @override
  Future<List<CartItemEntity>> getAllCartItems() async {
    final cartItemsDTO = await supabaseCartDatasource.getAllCartItems();
    final cartItemsEntity =
        cartItemsDTO.map((dto) => CartItemEntity.fromDTO(dto)).toList();
    return cartItemsEntity;
  }
}
