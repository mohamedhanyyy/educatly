import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../config/l10n/generated/l10n.dart';
import '../controller/settings_controller.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileScreen extends ConsumerWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.invalidate(settingsControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(S().edit_profile)),
      body: EditProfileForm(user: PreferencesHelper.getUserModel!),
    );
  }
}
