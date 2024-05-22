import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double? topPadding;

  CustomLoadingWidget(this.topPadding);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: CircularProgressIndicator.adaptive(),
    ));
  }
}
