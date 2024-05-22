import '../../../config/l10n/generated/l10n.dart';
import '../../../core/extensions/string.dart';

class ValidationService {
  static String? userValidation(String? value) {
    if (value == null || value == "") {
      return S().text_field_empty_warning;
    } else {
      if (value.isNumber) {
        if (!value.isPhoneNumber) {
          return S().phone_not_valid;
        }
      } else if (value.contains('@')) {
        if (!value.isEmail) {
          return S().email_not_valid;
        }
      } else {
        if (!value.hasValidUserName) {
          return S().username_not_valid;
        }
      }
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email == null || email == "") {
      return S().text_field_empty_warning;
    } else if (!email.isEmail) {
      return S().email_not_valid;
    }
    return null;
  }

  static String? phoneValidation(String? phone) {
    if (phone == null || phone == "") {
      return S().text_field_empty_warning;
    } else if (!phone.isPhoneNumber) {
      return S().phone_not_valid;
    }
    return null;
  }

  static String? userNameValidation(String? username) {
    if (username == null || username.isEmpty) {
      return S().text_field_empty_warning;
    }
    if (!username.hasValidUserName) {
      return S().username_not_valid;
    }
    return null;
  }

  static String? nameValidation(String? name) {
    if (name == null || name.isEmpty) {
      return S().text_field_empty_warning;
    }
    if (name.length < 5) {
      return S().name_short_warning;
    }
    if (name.length > 30) {
      return S().name_long_warning;
    }
    if (!name.hasValidName) {
      return S().username_not_valid;
    }
    return null;
  }

  static String? notEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return S().text_field_empty_warning;
    }
    return null;
  }

  static String? taskTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S().text_field_empty_warning;
    }


    final list=value.trim().split(' ');
    if (list.length<2) {
      return S().title_must_contain_two_words_at_least;
    }
    return null;
  }

  static String? subTaskValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S().text_field_empty_warning;
    }
    // List<String> words = value.split(' ');
    // if (words.length < 3) {
    //   return S().subTask_must_be_at_least_three_words;
    // }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return S().empty_password;
    }
    if (password.length < 8) {
      return S().too_short_password;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return S().missing_uppercase;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return S().missing_lowercase;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return S().missingDigit;
    }
    if (!password.contains(RegExp(r'[@_]'))) {
      return S().missingSpecialChar;
    }
    return null;
  }
}
