import 'package:flutter/material.dart';

extension IterableEx on Iterable<Widget> {
  Iterable<Widget> addSeparator({required Widget child}) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield child;
        yield iterator.current;
      }
    }
  }
}
