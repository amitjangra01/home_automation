import 'package:flutter/material.dart';

import 'device.dart';

class RoomModel {
  final String name;
  final IconData icon;
  final List<IconData> icons;
  final List<Device> devices;
  final int index;
  const RoomModel({
    this.name = '',
    this.icon = Icons.home,
    this.icons = const <IconData>[],
    this.index = 0,
    this.devices = const <Device>[],
  });
}
