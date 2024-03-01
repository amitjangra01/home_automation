import 'package:flutter/material.dart';

import 'device.dart';

class RoomModel {
  final String name;
  final IconData icon;
  final List<IconData> icons;
  List<Device> devices;
  final int id;
  RoomModel({
    this.name = '',
    this.icon = Icons.home,
    this.icons = const <IconData>[],
    this.id = 0,
    this.devices = const <Device>[],
  });
}
