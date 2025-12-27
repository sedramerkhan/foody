
import 'package:flutter/material.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';

class IgnorePointerWithListenBuilder extends StatelessWidget {
  const IgnorePointerWithListenBuilder(
      {super.key, required this.valueListenable, required this.child});

  final ValueNotifier valueListenable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (ctx, value, _) => IgnorePointer(
              ignoring: value is Loading || value == true,
              child: child,
            ));
  }
}
