import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/detail/provider.dart';

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
                    title: device.name,
                    icon:
                        device.state ? device.activeIcon : device.inActiveIcon,
                    state: device.state,
                    onChanged: (value) {
                      ref
                          .read(
                              roomDevicesStateNotifierProvider(widget.model.id)
                                  .notifier)
                          .toggleDeviceState(device);

                      ref
                          .read(roomsStateNotifierProvider.notifier)
                          .update(state, widget.model.id);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
