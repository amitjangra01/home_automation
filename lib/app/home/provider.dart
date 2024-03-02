import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/models/room_model.dart';
import 'package:utils_widget/utils_widget.dart';

import '../models/device.dart';

final roomsStateNotifierProvider =
    StateNotifierProvider<RoomDevicesStateNotifier, List<RoomModel>>(
  (ref) => RoomDevicesStateNotifier(),
);

class RoomDevicesStateNotifier extends StateNotifier<List<RoomModel>> {
  RoomDevicesStateNotifier() : super([]);

  void setData(List<RoomModel> rooms) {
    state = rooms;
  }

  void update(List<Device> devices, int roomId) {
    final list = state.map((e) {
      if (e.id == roomId) {
        e.devices = devices;
      }
      return e;
    }).toList();
    state = list;
  }
}
