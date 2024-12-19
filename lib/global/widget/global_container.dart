import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  final double borderRadius;
  final BorderRadiusGeometry? borderCornerRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget? child;
  final Color color;
  final double? width;
  final double? height;

  const GlobalContainer({
    super.key,
    this.borderRadius = 0.0,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.child,
    this.width,
    this.height,
    this.color = Colors.white,
    this.borderCornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderCornerRadius ?? BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
