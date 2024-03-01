import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app/models/device.dart';
import '../app/models/room_model.dart';
import '../app/widgets/detail_page_tile.dart';

const iconSize = 20.0;

// const activeLightIcon = Icon(Icons.light_mode_outlined, size: iconSize);
// const inActiveLightIcon = Icon(Icons.light, size: iconSize);

LottieBuilder activeLightIcon =
    Lottie.asset('assets/lottie/light-on.json', height: 75);
LottieBuilder inActiveLightIcon =
    Lottie.asset('assets/lottie/light-off.json', height: 85);

Image inActiveFanIcon = Image.asset('assets/fan-2.png', scale: 0.8);
const activeFanIcon = RotatingFanIcon();

// const activeAcIcon = Icon(Icons.ac_unit, size: iconSize);
const inActiveAcIcon = Icon(Icons.power_settings_new, size: iconSize);
LottieBuilder activeAcIcon = Lottie.asset('assets/lottie/ac-on.json');

// const activeTvIcon = Icon(Icons.tv, size: iconSize);
const inActiveTvIcon = Icon(Icons.tv, size: iconSize);
LottieBuilder activeTvIcon =
    Lottie.asset('assets/lottie/tv-on.json', height: 95, width: 95);
// LottieBuilder inActiveTvIcon =
//     Lottie.asset('assets/lottie/tv-off.json', height: 75);

// const activeMusicIcon = Icon(Icons.music_note_outlined, size: iconSize);
LottieBuilder activeMusicIcon =
    Lottie.asset('assets/lottie/music-on.json', height: 85, width: 120);
const inActiveMusicIcon = Icon(Icons.music_off_outlined, size: iconSize);

const activeCurtainsIcon = Icon(Icons.curtains, size: iconSize);
const inActiveCurtainsIcon =
    Icon(Icons.curtains_closed_rounded, size: iconSize);

const activeRefrigeratorIcon = Icon(Icons.kitchen, size: iconSize);
const inActiveRefrigeratorIcon = Icon(Icons.cancel_outlined, size: iconSize);

const activeMicrowaveIcon = Icon(Icons.microwave, size: iconSize);
const inActiveMicrowaveIcon = Icon(Icons.cancel_outlined, size: iconSize);

const activeOvenIcon = Icon(Icons.heat_pump_rounded, size: iconSize);
const inActiveOvenIcon = Icon(Icons.cancel_outlined, size: iconSize);

List<RoomModel> roomsList = [
  bedroom,
  livingRoom,
  guestRoom,
  kitchen,
];

final bedroom = RoomModel(name: "Bedroom", icon: Icons.bed, id: 0, devices: [
  Device(
    name: 'Light',
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '101',
  ),
  Device(
    name: 'Fan',
    activeIcon: const RotatingFanIcon(speed: 3, state: true),
    inActiveIcon: inActiveFanIcon,
    state: true,
    intensity: 3,
    id: '102',
  ),
  Device(
    name: 'AC',
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: false,
    id: '103',
  ),
  Device(
    name: 'TV',
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '104',
  ),
]);

final livingRoom =
    RoomModel(name: "Living Room", icon: Icons.living, id: 1, devices: [
  Device(
    name: 'TV',
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '201',
  ),
  Device(
    name: 'AC',
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: true,
    id: '202',
  ),
  Device(
    name: 'Fan',
    activeIcon: const RotatingFanIcon(speed: 1, state: true),
    inActiveIcon: inActiveFanIcon,
    state: true,
    intensity: 1,
    id: '203',
  ),
  Device(
    name: 'Light',
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '204',
  ),
  Device(
    name: 'Music',
    activeIcon: activeMusicIcon,
    inActiveIcon: inActiveMusicIcon,
    state: false,
    id: '205',
  ),
  Device(
    name: 'Curtains',
    activeIcon: activeCurtainsIcon,
    inActiveIcon: inActiveCurtainsIcon,
    state: false,
    id: '206',
  ),
]);

final guestRoom =
    RoomModel(name: "Guest Room", icon: Icons.person, id: 2, devices: [
  Device(
    name: 'Light',
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '301',
  ),
  Device(
    name: 'TV',
    activeIcon: activeTvIcon,
    inActiveIcon: inActiveTvIcon,
    state: false,
    id: '302',
  ),
  Device(
    name: 'AC',
    activeIcon: activeAcIcon,
    inActiveIcon: inActiveAcIcon,
    state: true,
    id: '303',
  ),
]);

final kitchen =
    RoomModel(name: "Kitchen", icon: Icons.kitchen, id: 3, devices: [
  Device(
    name: 'Refrigerator',
    activeIcon: activeRefrigeratorIcon,
    inActiveIcon: inActiveRefrigeratorIcon,
    state: false,
    id: '401',
  ),
  Device(
    name: 'Microwave',
    activeIcon: activeMicrowaveIcon,
    inActiveIcon: inActiveMicrowaveIcon,
    state: false,
    id: '402',
  ),
  Device(
    name: 'Oven',
    activeIcon: activeOvenIcon,
    inActiveIcon: inActiveOvenIcon,
    state: false,
    id: '403',
  ),
  Device(
    name: 'Light',
    activeIcon: activeLightIcon,
    inActiveIcon: inActiveLightIcon,
    state: false,
    id: '404',
  ),
]);
