import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';
import '../models/device.dart';

final roomDevicesStateNotifierProvider =
    StateNotifierProvider.family<RoomDevicesStateNotifier, List<Device>, int>(
  (ref, roomId) => RoomDevicesStateNotifier(),
);

class RoomDevicesStateNotifier extends StateNotifier<List<Device>> {
  RoomDevicesStateNotifier() : super([]);

  void updateDevices(List<Device> devices) {
    state = devices;
  }

  void toggleDeviceState(Device device) {
    state = state.map((e) {
      if (e.id == device.id) {
        device.state = !device.state;
      }
      return e;
    }).toList();
  }

  void updateSpeed(Device device, int speed) {
    state = state.map((e) {
      if (e.id == device.id) {
        device.intensity = speed;
      }
      return e;
    }).toList();
    logger.d(state
        .map((e) =>
            'device: ${e.name} id: ${e.id} state: ${e.state} speed: ${e.intensity}')
        .toList());
  }
}
