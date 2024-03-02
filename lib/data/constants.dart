import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app/models/device.dart';
import '../app/models/room_model.dart';
import '../app/widgets/rotating_fan.dart';

const iconSize = 20.0;

/// Light Icons
LottieBuilder activeLightIcon =
    Lottie.asset('assets/lottie/light-on.json', height: 75);
// LottieBuilder inActiveLightIcon =
//     Lottie.asset('assets/lottie/light-off.json', height: 85);
const inActiveLightIcon = Icon(Icons.lightbulb_outline, size: iconSize);

/// Fan Icons
Image inActiveFanIcon = Image.asset(
  'assets/fan-filled.png',
  scale: 0.8,
  color: Colors.orange,
);
const activeFanIcon = RotatingFanIcon();

/// AC Icons
// const activeAcIcon = Icon(Icons.ac_unit, size: iconSize);
const inActiveAcIcon = Icon(
  Icons.power_settings_new,
  size: iconSize,
);
LottieBuilder activeAcIcon = Lottie.asset('assets/lottie/ac-on.json');

/// TV Icons
// const activeTvIcon = Icon(Icons.tv, size: iconSize);
// LottieBuilder inActiveTvIcon =
//     Lottie.asset('assets/lottie/tv-off.json', height: 75);
const inActiveTvIcon = Icon(Icons.tv, size: iconSize);
LottieBuilder activeTvIcon = Lottie.asset('assets/lottie/tv-on.json');

/// Music Icons
// const activeMusicIcon = Icon(Icons.music_note_outlined, size: iconSize);
LottieBuilder activeMusicIcon = Lottie.asset('assets/lottie/music.json');
const inActiveMusicIcon = Icon(Icons.music_off_outlined, size: iconSize);

/// Curtains Icons
const activeCurtainsIcon = Icon(Icons.curtains, size: iconSize);
const inActiveCurtainsIcon =
    Icon(Icons.curtains_closed_rounded, size: iconSize);

/// Refrigerator Icons
const activeRefrigeratorIcon = Icon(Icons.kitchen, size: iconSize);
const inActiveRefrigeratorIcon = Icon(Icons.kitchen, size: iconSize);

/// Microwave Icons
const activeMicrowaveIcon = Icon(Icons.microwave, size: iconSize);
const inActiveMicrowaveIcon = Icon(Icons.microwave_outlined, size: iconSize);

/// Oven Icons
const activeOvenIcon = Icon(Icons.heat_pump_rounded, size: iconSize);
const inActiveOvenIcon =
    Icon(Icons.local_fire_department_outlined, size: iconSize);

List<RoomModel> roomsList = [
  bedroom,
  livingRoom,
  guestRoom,
  kitchen,
];

enum DeviceName {
  light,
  fan,
  ac,
  tv,
  music,
  curtains,
  refrigerator,
  microwave,
  oven,
}

final bedroom = RoomModel(name: "Bedroom", icon: Icons.bed, id: 0, devices: [
  Device(
    name: DeviceName.light.name,
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '101',
  ),
  Device(
    name: DeviceName.fan.name,
    activeIcon: const RotatingFanIcon(speed: 3, state: true),
    inActiveIcon: inActiveFanIcon,
    state: true,
    intensity: 3,
    id: '102',
  ),
  Device(
    name: DeviceName.ac.name,
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: false,
    id: '103',
  ),
  Device(
    name: DeviceName.tv.name,
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '104',
  ),
]);

final livingRoom =
    RoomModel(name: "Living Room", icon: Icons.living, id: 1, devices: [
  Device(
    name: DeviceName.tv.name,
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '201',
  ),
  Device(
    name: DeviceName.ac.name,
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: true,
    id: '202',
  ),
  Device(
    name: DeviceName.fan.name,
    activeIcon: const RotatingFanIcon(speed: 1, state: true),
    inActiveIcon: inActiveFanIcon,
    state: true,
    intensity: 1,
    id: '203',
  ),
  Device(
    name: DeviceName.light.name,
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '204',
  ),
  Device(
    name: DeviceName.music.name,
    activeIcon: activeMusicIcon,
    inActiveIcon: inActiveMusicIcon,
    state: false,
    id: '205',
  ),
  Device(
    name: DeviceName.curtains.name,
    activeIcon: activeCurtainsIcon,
    inActiveIcon: inActiveCurtainsIcon,
    state: false,
    id: '206',
  ),
]);

final guestRoom =
    RoomModel(name: "Guest Room", icon: Icons.person, id: 2, devices: [
  Device(
    name: DeviceName.light.name,
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '301',
  ),
  Device(
    name: DeviceName.tv.name,
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '302',
  ),
  Device(
    name: DeviceName.ac.name,
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: true,
    id: '303',
  ),
]);

final kitchen =
    RoomModel(name: "Kitchen", icon: Icons.kitchen, id: 3, devices: [
  Device(
    name: DeviceName.refrigerator.name,
    activeIcon: activeRefrigeratorIcon,
    inActiveIcon: inActiveRefrigeratorIcon,
    state: false,
    id: '401',
  ),
  Device(
    name: DeviceName.microwave.name,
    activeIcon: activeMicrowaveIcon,
    inActiveIcon: inActiveMicrowaveIcon,
    state: false,
    id: '402',
  ),
  Device(
    name: DeviceName.oven.name,
    activeIcon: activeOvenIcon,
    inActiveIcon: inActiveOvenIcon,
    state: false,
    id: '403',
  ),
  Device(
    name: DeviceName.light.name,
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '404',
  ),
]);
