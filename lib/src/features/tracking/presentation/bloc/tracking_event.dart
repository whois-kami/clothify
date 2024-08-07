part of 'tracking_bloc.dart';

sealed class TrackingEvent extends Equatable {
  const TrackingEvent();

  @override
  List<Object> get props => [];
}


class GetCurrentOredersEvent extends TrackingEvent {}

class GetHistoryOredersEvent extends TrackingEvent {}