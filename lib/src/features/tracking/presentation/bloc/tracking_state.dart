part of 'tracking_bloc.dart';

sealed class TrackingState extends Equatable {
  const TrackingState();

  @override
  List<Object> get props => [];
}

final class TrackingInitial extends TrackingState {}

final class TrackingLoading extends TrackingState {}

final class TrackingLoaded extends TrackingState {
  final List<TrackingItemEntity> items;

  const TrackingLoaded({
    required this.items,
  });

  @override
  List<Object> get props => [items];
}

final class TrackingFailure extends TrackingState {
  final String message;
  const TrackingFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
