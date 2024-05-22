import 'package:flutter/material.dart';

void rebuild(Element e) {
  e.markNeedsBuild();
  e.visitChildren(rebuild);
}
