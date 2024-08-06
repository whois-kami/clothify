import 'dart:math';

String generateOrderId() {
  String currentDateKey = DateTime.now().toIso8601String().split('T').first;
  final random = Random();
  final randomNumbers1 = random.nextInt(1000000).toString().padLeft(6, '0');
  final randomNumbers2 = random.nextInt(1000000).toString().padLeft(6, '0');
  return '$randomNumbers1-$currentDateKey-$randomNumbers2';
}
