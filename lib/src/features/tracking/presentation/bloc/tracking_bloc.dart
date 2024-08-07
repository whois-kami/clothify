import 'package:ecom_app/src/features/tracking/domain/entities/tracking_item_entity.dart';
import 'package:ecom_app/src/features/tracking/domain/usecases/get_current_orders_usecase.dart';
import 'package:ecom_app/src/features/tracking/domain/usecases/get_history_orders_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

@injectable
class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final GetCurrentOrdersUsecase getCurrentOrdersUsecase;
  final GetHistoryOrdersUsecase getHistoryOrdersUsecase;
  TrackingBloc({
    required this.getCurrentOrdersUsecase,
    required this.getHistoryOrdersUsecase,
  }) : super(TrackingInitial()) {
    on<GetCurrentOredersEvent>(_getCurrentOreders);
    on<GetHistoryOredersEvent>(_getHistoryOrders);
  }

  Future<void> _getCurrentOreders(
      GetCurrentOredersEvent event, Emitter<TrackingState> emit) async {
    try {
      final items = await getCurrentOrdersUsecase.execute();
      emit(TrackingLoaded(items: items));
    } catch (e) {
      emit(TrackingFailure(message: e.toString()));
    }
  }

  Future<void> _getHistoryOrders(
      GetHistoryOredersEvent event, Emitter<TrackingState> emit) async {
    try {
      final items = await getHistoryOrdersUsecase.execute();
      emit(TrackingLoaded(items: items));
    } catch (e) {
      emit(TrackingFailure(message: e.toString()));
    }
  }
}
