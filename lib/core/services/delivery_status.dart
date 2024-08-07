enum DeliveryStatus {
  onTheWay,
  onProgress,
  completed,
}

extension StringFromDeliveryStatusExtension on DeliveryStatus {
  String get stringValue {
    switch (this) {
      case DeliveryStatus.onTheWay:
        return 'On the Way';
      case DeliveryStatus.onProgress:
        return 'On Progress';
      case DeliveryStatus.completed:
        return 'Completed';
    }
  }
}

DeliveryStatus deliveryStatusFromString(String status) {
  switch (status) {
    case 'On the Way':
      return DeliveryStatus.onTheWay;
    case 'On Progress':
      return DeliveryStatus.onProgress;
    case 'Completed':
      return DeliveryStatus.completed;
    default:
      throw ArgumentError('Invalid delivery status string: $status');
  }
}
