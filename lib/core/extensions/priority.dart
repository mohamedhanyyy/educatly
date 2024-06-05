import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/l10n/generated/l10n.dart';
import '../constants/assets.dart';

extension PriorityExtension on int {
  String get getPriorityFlag {
    switch (this) {
      case 1:
        return Assets.icons.flag0;
      case 2:
        return Assets.icons.flag1;
      default:
        return Assets.icons.flag2;
    }
  }

  Color get getPriorityColor {
    switch (this) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.amber;
      default:
        return Colors.red;
    }
  }

  String get getPriorityTitle {
    switch (this) {
      case 1:
        return S().low;
      case 2:
        return S().medium;
      default:
        return S().high;
    }
  }
}

priorityIconMapper(int? priorityId) {
  Map<int, String> map = {
    1: Assets.icons.flag0,
    2: Assets.icons.flag1,
    3: Assets.icons.flag2,
  };
  if (priorityId != null) return SvgPicture.asset(map[priorityId]!);
}
