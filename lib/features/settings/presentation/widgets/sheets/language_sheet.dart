import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/widget_manager.dart';
import '../../../../../../core/constants/language_list.dart';
import '../../../../../../core/extensions/iterator_extension.dart';
import '../../../../../core/controllers/localization/localization_controller.dart';
import '../profile_option.dart';

class LanguageSheet extends ConsumerWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: LanguageData.languageList
            .map(
              (LanguageData) {
                final _status = ref.watch(localizationControllerProvider);
                final bool _isSelected =
                    _status.languageCode == LanguageData.code;
                return ProfileOption(
                  icon: Icons.language_rounded,
                  title: LanguageData.name,
                  onTap: () async {
                    if (_status != LanguageData.code) {
                      ref
                          .read(localizationControllerProvider.notifier)
                          .setAppLocalization(LanguageData.code);
                    }
                  },
                  trailing: Icon(
                    Icons.check_rounded,
                    color: _isSelected
                        ? AppColors.colors.active
                        : Theme.of(context).cardColor,
                  ),
                );
              },
            )
            .toList()
            .addSeparator(child: AppSizes.size10.verticalSpace)
            .toList(),
      ).defaultScreenPadding,
    );
  }
}
