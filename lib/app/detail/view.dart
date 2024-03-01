import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../models/room_model.dart';
import '../widgets/detail_page_tile.dart';

class DetailsView extends StatefulWidget {
  final RoomModel model;
  const DetailsView({
    super.key,
    required this.model,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
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
          children: widget.model.devices
              .map((e) => DetailPageTile(
                    title: e.name,
                    icon: e.state ? e.activeIcon : e.inActiveIcon,
                    state: e.state,
                    onChanged: (value) {
                      setState(() {
                        e.state = !e.state;
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}

Widget getIcon({String value = '', bool state = false, int speed = 1}) {
  switch (value) {
    case 'Refrigerator':
      return const Icon(Icons.kitchen);
    case 'Microwave':
      return const Icon(Icons.microwave);
    case 'Oven':
      return const Icon(Icons.heat_pump);
    case 'Light':
      return const Icon(Icons.lightbulb);
    case 'Fan':
      return RotatingFanIcon(state: state, speed: speed);
    default:
      return const Icon(Icons.home);
  }
}
