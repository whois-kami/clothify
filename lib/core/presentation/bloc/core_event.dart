part of 'core_bloc.dart';

sealed class CoreEvent extends Equatable {
  const CoreEvent();

  @override
  List<Object> get props => [];
}

class LikeProductEvent extends CoreEvent {
  final String productId;
  const LikeProductEvent({
    required this.productId,
  });
  @override
  List<Object> get props => [productId];
}

class DislikeProductEvent extends CoreEvent {
  final String productId;
  const DislikeProductEvent({
    required this.productId,
  });
  @override
  List<Object> get props => [productId];
}

class SyncWithDBEvent extends CoreEvent {}

class GetProfileEvent extends CoreEvent {}