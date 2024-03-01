import 'package:flutter/material.dart';

import '../detail/view.dart';
import '../models/device.dart';
import '../models/room_model.dart';

class HomePageTile extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final int index;
  final double radius;
  final List<Device> devices;
  const HomePageTile({
    super.key,
    this.title = "",
    this.color = Colors.teal,
    this.icon = Icons.home,
    this.index = 0,
    this.radius = 20,
    this.devices = const [],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(
              model: RoomModel(
                name: title,
                icon: icon,
                index: index,
                devices: devices,
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: index == 0
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                )
              : index == 1
                  ? BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    )
                  : index == 2
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                        )
                      : index == 3
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(radius),
                              topRight: Radius.circular(radius),
                              bottomRight: Radius.circular(radius),
                            )
                          : null,
          border: Border.all(
            // color: Colors.teal,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Icon(icon, size: 30, color: Colors.teal),
            const SizedBox(height: 50),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                // color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${devices.length} devices',
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
