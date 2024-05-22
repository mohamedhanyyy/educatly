import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/l10n/generated/l10n.dart';
import '../constants/assets.dart';
priorityIdMapper(id) {
  switch (id) {
    case 1:
      return S().low;
    case 2:
      return S().medium;
    case 3:
      return S().high;
  }
}
mappingPriorityStrings(String p) {
  switch (p) {
    case 'Low'|| "منخفضة":
      return 1;
    case 'Medium' ||"متوسطة":
      return 2;
    case 'High' || "مرتفعة":
      return 3;
  }
}
statusIdMapper(id) {
  switch (id) {
    case 1:
      return S().neww;
    case 2:
      return S().in_progress;
    case 3:
      return S().completed;
  }
}
colorStatusIdMapper(id) {
  switch (id) {
    case 1:
      return Colors.green;
    case 2:
      return Colors.amber;
    case 3:
      return Colors.red;
  }
}



statusPrioritySvgMapper(name) {
  Map<int, String> map = {
    1: Assets.icons.flag0,
    2: Assets.icons.flag1,
    3: Assets.icons.flag2,
  };
  if (name != null) return SvgPicture.asset(map[name]!);
}
