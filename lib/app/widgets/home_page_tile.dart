import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/detail/provider.dart';

import '../detail/view.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            const SizedBox(height: 46),
            Text(
              room.name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                if (onDevices.isNotEmpty) ...[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: const Border(
                        left: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...onDevices
                            .map((e) => SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: e.activeIcon,
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
                if (offDevices.isNotEmpty)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: const Border(
                        left: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...offDevices
                            .map((e) => SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: e.smallInactiveIcon,
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
