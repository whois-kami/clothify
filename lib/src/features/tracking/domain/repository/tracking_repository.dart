import 'package:ecom_app/src/features/tracking/domain/entities/tracking_item_entity.dart';

abstract class TrackingRepository {
  Future<List<TrackingItemEntity>> getCurrentOrders();
  Future<List<TrackingItemEntity>> getHistoryOrders();
}
