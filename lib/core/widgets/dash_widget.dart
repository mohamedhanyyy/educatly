import 'package:flutter/material.dart';

class DashWidget extends StatelessWidget {
  final Color color;

  const DashWidget({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const dashWidth = 1.0;
        final dashHeight = 3.0;
        final boxHeight = constraints.constrainHeight();
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
