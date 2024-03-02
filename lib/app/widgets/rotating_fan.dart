import 'package:flutter/material.dart';

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
    // _controller = AnimationController(
    //   duration: widget.speed != 0 && widget.state
    //       ? Duration(milliseconds: 1000 ~/ widget.speed)
    //       : const Duration(days: 365),
    //   vsync: this,
    // );
    // _controller.repeat();
    super.initState();
    _setupAnimation();
  }

  void _setupAnimation() {
    _controller = AnimationController(
      duration: _calculateAnimationDuration(),
      vsync: this,
    );
    _controller.repeat();
  }

  Duration _calculateAnimationDuration() {
    return widget.speed != 0 && widget.state
        ? Duration(milliseconds: 1000 ~/ widget.speed)
        : const Duration(days: 365);
  }

  @override
  void didUpdateWidget(covariant RotatingFanIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed || oldWidget.state != widget.state) {
      _controller.duration = _calculateAnimationDuration();
    }
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
      child: SizedBox(
        height: 55,
        width: 55,
        child: Image.asset(
          'assets/fan-filled.png',
          color: Colors.orange,
        ),
      ),
    );
  }
}
