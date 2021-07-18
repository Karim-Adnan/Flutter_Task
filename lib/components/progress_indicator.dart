import 'package:flutter/material.dart';
import 'package:flutter_task/constants.dart';
import 'dart:math' as math;

import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: screenHeight * 0.075,
            backgroundImage: const AssetImage(
              "assets/images/profileImg.png",
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 300,
              radius: screenHeight * 0.15,
              lineWidth: screenHeight * 0.01,
              percent: 0.75,
              backgroundColor: Colors.transparent,
              progressColor: kAvatarProgressIndicatorColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ],
      ),
    );
  }
}