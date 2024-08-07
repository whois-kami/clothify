// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/tracking/data/DTO/tracking_item_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseTrackingDatasource {
  final SupabaseClient supabase;
  const SupabaseTrackingDatasource({
    required this.supabase,
  });

  Future<List<TrackingItemDto>> getCurrentOrders() async {
    final uUID = supabase.auth.currentUser!.id;

    final response =
        await supabase.from('profiles').select('orders_status').eq('UID', uUID);

    List<TrackingItemDto> trackingItemsDTO = [];

    for (var profile in response as List<dynamic>) {
      final List<dynamic> ordersStatus = profile['orders_status'];

      for (var orderEntry in ordersStatus) {
        var order = orderEntry as Map<String, dynamic>;
        var orderID = order.keys.first;
        var items = order[orderID] as List<dynamic>;

        for (var item in items) {
          if (item['status'] == 'On Progress' ||
              item['status'] == 'On the Way') {
            final TrackingItemDto product = TrackingItemDto.fromJson(item);
            trackingItemsDTO.add(product);
          }
        }
      }
    }

    return trackingItemsDTO;
  }

  Future<List<TrackingItemDto>> getHistoryItems() async {
    final uUID = supabase.auth.currentUser!.id;

    final response =
        await supabase.from('profiles').select('orders_status').eq('UID', uUID);

    List<TrackingItemDto> historyItemsDTO = [];

    for (var profile in response as List<dynamic>) {
      final List<dynamic> ordersStatus = profile['orders_status'];

      for (var orderEntry in ordersStatus) {
        var order = orderEntry as Map<String, dynamic>;
        var orderID = order.keys.first;
        var items = order[orderID] as List<dynamic>;

        for (var item in items) {
          if (item['status'] == 'Completed') {
            final TrackingItemDto product = TrackingItemDto.fromJson(item);
            historyItemsDTO.add(product);
          }
        }
      }
    }

    return historyItemsDTO;
  }
}
