import 'package:assignment/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.neutralGray0,
      fontFamily: 'SFProDisplayRegular',
      useMaterial3: true,
    );
  }
}
