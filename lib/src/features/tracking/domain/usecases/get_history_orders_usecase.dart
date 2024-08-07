// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/tracking/domain/entities/tracking_item_entity.dart';
import 'package:ecom_app/src/features/tracking/domain/repository/tracking_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoryOrdersUsecase {
 final TrackingRepository trackingRepository;
 const GetHistoryOrdersUsecase({
    required this.trackingRepository,
  });

  Future<List<TrackingItemEntity>> execute() async {
   return await trackingRepository.getHistoryOrders();
  }
}
