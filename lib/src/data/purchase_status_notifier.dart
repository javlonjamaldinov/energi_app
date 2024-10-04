import 'dart:async';

class PurchaseStatusNotifier {
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  Stream<bool> get statusStream => _controller.stream;

  void updateStatus(bool status) {
    _controller.sink.add(status);
  }

  void dispose() {
    _controller.close();
  }
}

// Глобальный экземпляр PurchaseStatusNotifier
final purchaseStatusNotifier = PurchaseStatusNotifier();
