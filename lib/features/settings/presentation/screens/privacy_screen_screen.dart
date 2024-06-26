import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/widgets/refresh_widget.dart';

import '../../../../config/l10n/generated/l10n.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../core/constants/constants.dart';
import '../controller/privacy_controller.dart';
import '../widgets/privacy_widget.dart';

class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(S().privacy_policy)),
      body: ref.watch(privacyControllerProvider).when(
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => Center(
              child: RefreshWidget(
                onTap: () async => ref.refresh(privacyControllerProvider),
              ),
            ),
            data: (data) {
              return SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async => ref
                      .read(privacyControllerProvider.notifier)
                      .getPrivacyPolicy(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    padding: AppConstants.defaultHorizontalPadding,
                    separatorBuilder: (_, __) => AppSizes.size10.verticalSpace,
                    itemBuilder: (_, index) =>
                        PrivacyWidget(privacy: data[index]),
                  ),
                ),
              );
            },
          ),
    );
  }
}
