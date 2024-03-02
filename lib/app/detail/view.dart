import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/detail/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../data/constants.dart';
import '../home/provider.dart';
import '../models/device.dart';
import '../models/room_model.dart';
import '../widgets/detail_page_tile.dart';

class DetailsView extends ConsumerStatefulWidget {
  final RoomModel model;
  const DetailsView({
    super.key,
    required this.model,
  });

  @override
  ConsumerState<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends ConsumerState<DetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(roomDevicesStateNotifierProvider(widget.model.id));
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.model.name} devices"),
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: state
              .map((device) => DetailPageTile(
                  device: device,
                  roomId: widget.model.id,
                  onChanged: (value) {
                    ref
                        .read(roomDevicesStateNotifierProvider(widget.model.id)
                            .notifier)
                        .toggleDeviceState(device);

                    ref
                        .read(roomsStateNotifierProvider.notifier)
                        .update(state, widget.model.id);
                  },
                  onSpeedChange: (value) {
                    ref
                        .read(roomDevicesStateNotifierProvider(widget.model.id)
                            .notifier)
                        .updateSpeed(device, value);

                    ref
                        .read(roomsStateNotifierProvider.notifier)
                        .update(state, widget.model.id);
                  }))
              .toList(),
        ),
      ),
    );
  }
}
