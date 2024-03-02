import 'package:flutter/material.dart';
import 'package:home_automation/app/detail/provider.dart';
import 'package:home_automation/app/utils/detail_page_active_icon.dart';
import 'package:home_automation/data/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

import '../models/device.dart';
import '../utils/detail_page_inactive_icon.dart';

class DetailPageTile extends HookConsumerWidget {
  final Device device;
  final int roomId;
  final void Function(bool)? onChanged;
  final Function(int)? onSpeedChange;
  const DetailPageTile({
    super.key,
    required this.device,
    required this.roomId,
    this.onChanged,
    this.onSpeedChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomDevices = ref.watch(roomDevicesStateNotifierProvider(roomId));
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: device.state ? Colors.pink : Colors.grey,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (device.name == DeviceName.fan.name)
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                onSelected: onSpeedChange,
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Low'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Mid'),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text('High'),
                    ),
                  ];
                },
              ),
            ),
          if (device.name != DeviceName.fan.name) const SizedBox(height: 40),
          SizedBox(
            height: 55,
            width: 55,
            child: Center(
                child: device.state
                    ? getDetailPageActiveIcon(device)
                    : getDetailPageInactiveIcon(device, context)),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                device.name.toTitleCase(),
                textScaler: const TextScaler.linear(1.2),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Switch(
                value: device.state,
                activeColor: Colors.pink,
                onChanged: onChanged,
              )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
