import 'package:flutter/material.dart';

import '../widgets/detail_page_tile.dart';

class Device {
  final String name;
  final Widget activeIcon;
  final Widget inActiveIcon;
  bool state;
  final int intensity;
  Device({
    required this.name,
    required this.activeIcon,
    required this.inActiveIcon,
    this.state = false,
    this.intensity = 0,
  });

  Widget get fanActiveIcon {
    if (name == 'Fan') {
      return RotatingFanIcon(state: state, speed: intensity);
    }
    return state ? activeIcon : inActiveIcon;
  }
}
