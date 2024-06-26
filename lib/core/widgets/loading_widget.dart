import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double? topPadding;
  final Key? key;
  const CustomLoadingWidget({this.topPadding, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: const CircularProgressIndicator.adaptive(),
    ));
  }
}
