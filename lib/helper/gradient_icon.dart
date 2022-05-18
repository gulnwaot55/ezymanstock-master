import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child,this.radius = 1.0});
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.centerLeft,
          radius: radius,
          colors: <Color>[
            const Color.fromRGBO(0, 176, 155, 1),
            const Color.fromRGBO(103, 224, 63, 1)
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
