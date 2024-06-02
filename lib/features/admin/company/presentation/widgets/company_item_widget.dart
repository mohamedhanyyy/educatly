import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/widgets/network_image.dart';
import '../../data/model/company_model.dart';

class CompanyItemWidget extends StatelessWidget {
  const CompanyItemWidget(this.companyData, {super.key});

  final CompanyModel companyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 21.h, bottom: 10.h, right: 17.w, left: 17.w),
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.colors.primary,
          )),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: AppCachedNetworkImage(
                    '${AppConstants.subDomain}${companyData.logo}',
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120.w,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/bag.svg'),
                      AppSizes.size5.horizontalSpace,
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          '${S().completed_tasks}\n${companyData.tasksState?.taskCompleteCount}',
                          style: StylesManager.regular(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 2, height: 15, color: AppColors.colors.chartBlue),
                //  Spacer(),
                SizedBox(
                  width: 120.w,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/stat.svg'),
                      AppSizes.size5.horizontalSpace,
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          '${S().in_progress_tasks}\n${companyData.tasksState?.taskInProgressCount}',
                          style: StylesManager.regular(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.colors.primary.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.antiAlias,
                  child: AppCachedNetworkImage(
                      '${AppConstants.subDomain}${companyData.manager?.imageName}',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover)),
            ),
          ),
          AppSizes.size5.verticalSpace,
          Text(
            "${context.isCurrentArabic ? companyData.nameAr : companyData.nameEn}",
            style: StylesManager.semiBold(
              color: AppColors.colors.darkBlue,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
