import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailPageTile extends HookConsumerWidget {
  final String title;
  final Widget icon;
  final bool state;
  final void Function(bool)? onChanged;
  const DetailPageTile({
    super.key,
    this.title = '',
    required this.icon,
    this.state = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: state ? Colors.pink : Colors.grey,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 30),
          icon,
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textScaler: const TextScaler.linear(1.2),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Switch(
                value: state,
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

class RotatingFanIcon extends StatefulWidget {
  final int speed;
  final bool state;
  const RotatingFanIcon({super.key, this.speed = 0, this.state = false});

  @override
  State<RotatingFanIcon> createState() => _RotatingFanIconState();
}

class _RotatingFanIconState extends State<RotatingFanIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.speed != 0 && widget.state
          ? Duration(milliseconds: 1000 ~/ widget.speed)
          : const Duration(days: 365),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: Image.asset(
        'assets/fan-2.png',
        scale: 0.8,
      ),
    );
  }
}
