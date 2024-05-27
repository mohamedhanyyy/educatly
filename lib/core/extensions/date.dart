import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../config/l10n/generated/l10n.dart';

extension DateDifferenceExtension on DateTime {
  String getDifferenceFromToday() {
    final now = DateTime.now();

    if (this.isBefore(now)) {
      final difference = now.difference(this);
      if (difference.inHours < 1) {
        if (difference.inMinutes < 1) return S().now;
        return S().ago + '${difference.inMinutes} ' + S().minutes_ago;
      } else if (difference.inHours >= 1 && difference.inHours < 24) {
        return S().ago + '${difference.inHours} ' + S().hours_ago;
      } else if (difference.inHours >= 24 && difference.inHours < 48) {
        return S().yesterday;
      } else if (difference.inDays > 1 && difference.inDays <= 5) {
        if (AppRouter.navigatorState.currentContext!.isCurrentArabic) {
          return S().ago + '${difference.inDays} ' + S().days_ago;
        } else {
          return '${difference.inDays} ' + S().days_ago;
        }
      } else if (difference.inDays > 5 && difference.inDays < 14) {
        return S().last_week;
      } else if (difference.inDays >= 14 && difference.inDays < 30) {
        final weeks = (difference.inDays / 7).round();

        if (AppRouter.navigatorState.currentContext!.isCurrentArabic) {
          return S().ago + '$weeks ' + S().weeks_ago;
        } else {
          return '$weeks ' + S().weeks_ago;
        }
      } else if (difference.inDays >= 30 && difference.inDays < 365) {
        final months = (difference.inDays / 30).round();
        if (months == 1) return S().last_month;
        return S().ago + '$months ' + S().months_ago;
      } else if (now.year >= this.year) {
        final years = now.year - this.year;
        if (years == 1) return S().last_year;
        return S().ago + '$years ' + S().years_ago;
      } else {
        return S().invalid_date;
      }
    } else if (this.isAfter(now) || this.isAtSameMomentAs(now)) {
      final difference = this.difference(now);
      if (difference.inHours < 1) {
        if (difference.inMinutes < 1) return S().now;
        return S().in_date + ' ${difference.inMinutes} ' + S().minutes;
      } else if (difference.inHours >= 1 && difference.inHours < 24) {
        return S().in_date + ' ${difference.inHours} ' + S().hours;
      } else if (difference.inHours >= 24 && difference.inHours < 48) {
        return S().tomorrow;
      } else if (difference.inDays > 1 && difference.inDays < 7) {
        return S().in_date + ' ${difference.inDays} ' + S().days;
      } else if (difference.inDays >= 7 && difference.inDays < 14) {
        return S().next_week;
      } else if (difference.inDays >= 14 && difference.inDays < 30) {
        final weeks = (difference.inDays / 7).round();
        return S().in_date + ' $weeks ' + S().weeks;
      } else if (difference.inDays >= 30 && difference.inDays < 365) {
        final months = (difference.inDays / 30).round();
        if (months == 1) return S().next_month;
        return S().in_date + ' $months ' + S().months;
      } else if (this.year >= now.year) {
        final years = this.year - now.year;
        if (years == 1) return S().next_year;
        return S().in_date + ' $years ' + S().years;
      } else {
        return S().invalid_date;
      }
    } else {
      return S().invalid_date;
    }
  }
}
