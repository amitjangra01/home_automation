import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/detail/provider.dart';

import '../detail/view.dart';
import '../models/device.dart';
import '../models/room_model.dart';

class HomePageTile extends ConsumerWidget {
  final RoomModel room;
  final double radius;
  const HomePageTile({
    super.key,
    required this.room,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = AdaptiveTheme.of(context).mode;
    const light = AdaptiveThemeMode.light;
    final onDevices = room.devices.where((element) => element.state).toList();
    final offDevices = room.devices.where((element) => !element.state).toList();
    return GestureDetector(
      onTap: () {
        ref
            .read(roomDevicesStateNotifierProvider(room.id).notifier)
            .updateDevices(room.devices);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(
              model: room,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: room.id == 0
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                )
              : room.id == 1
                  ? BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    )
                  : room.id == 2
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                        )
                      : room.id == 3
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(radius),
                              topRight: Radius.circular(radius),
                              bottomRight: Radius.circular(radius),
                            )
                          : null,
          border: Border.all(
            color: mode == light ? Colors.teal : Colors.grey,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Icon(room.icon,
                size: 30, color: mode == light ? Colors.teal : Colors.grey),
            const SizedBox(height: 50),
            Text(
              room.name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: mode == light ? Colors.green : Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...room.devices
                          .where((element) => element.state)
                          .toList()
                          .map((e) => Container(
                                height: 20,
                                width: 20,
                                child: e.activeIcon,
                              ))
                          .toList(),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...room.devices
                          .where((element) => !element.state)
                          .toList()
                          .map((e) => Container(
                                height: 20,
                                width: 20,
                                child: e.inActiveIcon,
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnOffSwitches extends StatelessWidget {
  final RoomModel room;
  final List<Device> onDevices;
  final List<Device> offDevices;
  const OnOffSwitches(
      {super.key,
      required this.room,
      required this.onDevices,
      required this.offDevices});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            GridView.count(
              crossAxisCount: 2,
              children: room.devices
                  .where((element) => element.state)
                  .toList()
                  .map((e) => SizedBox(
                        height: 20,
                        width: 20,
                        child: e.activeIcon,
                      ))
                  .toList(),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
            )
          ],
        )
      ]),
    );
  }
}
