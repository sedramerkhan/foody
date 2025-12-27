import 'package:flutter/material.dart';

class GapH extends StatelessWidget {
  const GapH([this.height = 0, Key? key]) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}