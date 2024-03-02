import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../models/device.dart';

getDetailPageInactiveIcon(Device device, BuildContext context) {
  switch (device.name) {
    case 'tv':
      return const Icon(Icons.tv, size: 50);
    case 'ac':
      return const Icon(Icons.power_settings_new_outlined, size: 50);
    case 'light':
      return Image.asset(
        'assets/bulb-off.png',
        height: 50,
        width: 50,
        color:
            AdaptiveTheme.of(context).mode.isDark ? Colors.white : Colors.black,
      );
    case 'fan':
      return SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/fan-filled.png',
            color: Colors.orange,
          ));
    case 'music':
      return const Icon(Icons.music_note_outlined, size: 50);
    case 'curtains':
      return const Icon(Icons.curtains_closed_rounded, size: 50);
    case 'refrigerator':
      return const Icon(Icons.kitchen, size: 50);
    case 'microwave':
      return const Icon(Icons.microwave, size: 50);
    case 'oven':
      return const Icon(Icons.heat_pump_rounded, size: 50);
    default:
      return const Icon(Icons.lightbulb_outline, size: 50);
  }
}
