import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/toast_helper.dart';

extension AsyncValueExtension on AsyncValue {
  void handleGuardResults<T>(
      {required dynamic ref, Function? onSuccess, Function? onError}) {
    if (hasError) {
      if (error != null) {
        Toast.showErrorToast(error.toString());
      }
      if (onError != null) {
        //todo
        // onError();
      }
    } else {
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }
}
