import 'package:flutter/material.dart';
import 'package:home_automation/widgets/detail_page_tile.dart';
import 'package:lottie/lottie.dart';

import '../models/device.dart';
import '../models/home_model.dart';

const iconSize = 50.0;

// const activeLightIcon = Icon(Icons.light_mode_outlined, size: iconSize);
// const inActiveLightIcon = Icon(Icons.light, size: iconSize);

LottieBuilder activeLightIcon =
    Lottie.asset('assets/lottie/light-on.json', height: 75);
LottieBuilder inActiveLightIcon =
    Lottie.asset('assets/lottie/light-off.json', height: 85);

Image inActiveFanIcon = Image.asset('assets/fan-2.png', scale: 0.8);
const activeFanIcon = RotatingFanIcon();

const activeAcIcon = Icon(Icons.ac_unit, size: iconSize);
const inActiveAcIcon = Icon(Icons.heat_pump_outlined, size: iconSize);

// const activeTvIcon = Icon(Icons.tv, size: iconSize);
LottieBuilder activeTvIcon =
    Lottie.asset('assets/lottie/tv-on.json', height: 75);
const inActiveTvIcon = Icon(Icons.tv_off, size: iconSize);

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

List<RoomModel> homePageTiles = [
  RoomModel(name: "Bedroom", icon: Icons.bed, index: 0, devices: [
    Device(
      name: 'Light',
      activeIcon: activeLightIcon,
      inActiveIcon: inActiveLightIcon,
      state: false,
    ),
    Device(
      name: 'Fan',
      activeIcon: const RotatingFanIcon(speed: 3, state: true),
      inActiveIcon: inActiveFanIcon,
      state: true,
      intensity: 3,
    ),
    Device(
      name: 'AC',
      activeIcon: activeAcIcon,
      inActiveIcon: inActiveAcIcon,
      state: false,
    ),
    Device(
      name: 'TV',
      activeIcon: activeTvIcon,
      inActiveIcon: inActiveTvIcon,
      state: false,
    ),
  ]),
  RoomModel(name: "Living Room", icon: Icons.living, index: 1, devices: [
    Device(
      name: 'TV',
      activeIcon: activeTvIcon,
      inActiveIcon: inActiveTvIcon,
      state: false,
    ),
    Device(
      name: 'AC',
      activeIcon: activeAcIcon,
      inActiveIcon: inActiveAcIcon,
      state: true,
    ),
    Device(
      name: 'Fan',
      activeIcon: const RotatingFanIcon(speed: 1, state: true),
      inActiveIcon: inActiveFanIcon,
      state: true,
      intensity: 1,
    ),
    Device(
      name: 'Light',
      activeIcon: activeLightIcon,
      inActiveIcon: inActiveLightIcon,
      state: false,
    ),
    Device(
      name: 'Music',
      activeIcon: activeMusicIcon,
      inActiveIcon: inActiveMusicIcon,
      state: false,
    ),
    Device(
      name: 'Curtains',
      activeIcon: activeCurtainsIcon,
      inActiveIcon: inActiveCurtainsIcon,
      state: false,
    ),
  ]),
  RoomModel(name: "Guest Room", icon: Icons.person, index: 2, devices: [
    Device(
      name: 'Light',
      activeIcon: activeLightIcon,
      inActiveIcon: inActiveLightIcon,
      state: false,
    ),
    Device(
      name: 'TV',
      activeIcon: activeTvIcon,
      inActiveIcon: inActiveTvIcon,
      state: false,
    ),
    Device(
      name: 'AC',
      activeIcon: activeAcIcon,
      inActiveIcon: inActiveAcIcon,
      state: true,
    ),
  ]),
  RoomModel(name: "Kitchen", icon: Icons.kitchen, index: 3, devices: [
    Device(
      name: 'Refrigerator',
      activeIcon: activeRefrigeratorIcon,
      inActiveIcon: inActiveRefrigeratorIcon,
      state: false,
    ),
    Device(
      name: 'Microwave',
      activeIcon: activeMicrowaveIcon,
      inActiveIcon: inActiveMicrowaveIcon,
      state: false,
    ),
    Device(
      name: 'Oven',
      activeIcon: activeOvenIcon,
      inActiveIcon: inActiveOvenIcon,
      state: false,
    ),
    Device(
      name: 'Light',
      activeIcon: activeLightIcon,
      inActiveIcon: inActiveLightIcon,
      state: false,
    ),
  ]),
];
