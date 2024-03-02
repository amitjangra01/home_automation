import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/device.dart';

getDetailPageActiveIcon(Device device) {
  switch (device.name) {
    case 'music':
      return Lottie.asset(
        'assets/lottie/music.json',
      );
    case 'curtains':
      return const Icon(Icons.curtains, size: 50);
    case 'refrigerator':
      return const Icon(Icons.kitchen, size: 50);
    case 'microwave':
      return Lottie.asset('assets/lottie/heat.json');
    case 'oven':
      return Lottie.asset('assets/lottie/heat.json');
    default:
      return device.activeIcon;
  }
}
