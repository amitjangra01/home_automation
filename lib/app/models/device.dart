import 'package:flutter/material.dart';

class Device {
  final String name;
  final Widget activeIcon;
  final Widget inActiveIcon;
  bool state;
  int intensity;
  final String id;
  Device({
    required this.name,
    required this.activeIcon,
    required this.inActiveIcon,
    this.state = false,
    this.intensity = 0,
    required this.id,
  });

  Widget get smallInactiveIcon {
    return SizedBox(height: 20, width: 20, child: inActiveIcon);
  }
}
