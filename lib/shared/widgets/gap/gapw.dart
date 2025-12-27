

import 'package:flutter/material.dart';

class GapW extends StatelessWidget {
  const GapW([this.width = 0, Key? key]) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}