// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/tracking/data/data_source/supabase_datasource.dart';
import 'package:injectable/injectable.dart';

import 'package:ecom_app/src/features/tracking/domain/entities/tracking_item_entity.dart';
import 'package:ecom_app/src/features/tracking/domain/repository/tracking_repository.dart';

@LazySingleton(as: TrackingRepository)
class TrackingRepositoryImpl implements TrackingRepository {
  final SupabaseTrackingDatasource supabaseTrackingDatasource;
  const TrackingRepositoryImpl({
    required this.supabaseTrackingDatasource,
  });
  @override
  Future<List<TrackingItemEntity>> getCurrentOrders() async {
    final dtos = await supabaseTrackingDatasource.getCurrentOrders();
    final List<TrackingItemEntity> currentOrders =
        dtos.map((el) => TrackingItemEntity.fromDTO(el)).toList();
    return currentOrders;
  }

  @override
  Future<List<TrackingItemEntity>> getHistoryOrders() async {
    final dtos = await supabaseTrackingDatasource.getHistoryItems();
    final List<TrackingItemEntity> historyOrders =
        dtos.map((el) => TrackingItemEntity.fromDTO(el)).toList();
    return historyOrders;
  }
}
