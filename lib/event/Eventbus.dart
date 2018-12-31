import 'package:event_bus/event_bus.dart';

class EventBusProvider {
  static var _eventBus = EventBus();

  static EventBus defaultInstance() {
    return _eventBus;
  }
}
