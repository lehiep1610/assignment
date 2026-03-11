import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/shared/extensions/string_extension.dart';

class FormValidators {
  FormValidators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) return AppStrings.errorEmailRequired;
    if (!value.isValidEmail) return AppStrings.errorEmailInvalid;
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return AppStrings.errorPasswordRequired;
    return null;
  }
}
