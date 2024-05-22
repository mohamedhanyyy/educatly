import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/widgets/refresh_widget.dart';
import '../controller/get_companies_controller.dart';
import '../widgets/company_item_widget.dart';

class GetCompaniesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S().all_companies),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.sp,
            padding: EdgeInsets.zero,
            onPressed: () {
              AppRouter.router.pushNamed(AppRoutes.addCompany);
            },
          )
        ],
      ),
      body: Center(
        child: ref
            .watch(getCompaniesControllerProvider)
            .when(
              loading: () =>
                  Center(child: CircularProgressIndicator.adaptive()),
              error: (error, stackTrace) => RefreshWidget(
                onTap: () async =>
                    await ref.refresh(getCompaniesControllerProvider),
              ),
              data: (companyData) {
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return CompanyItemWidget(companyData[index]);
                  },
                  shrinkWrap: true,
                  itemCount: companyData.length,
                  physics: const BouncingScrollPhysics(),
                ).defaultScreenPadding;
              },
            )
            .defaultScreenPadding,
      ),
    );
  }
}
