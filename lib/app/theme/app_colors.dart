import 'package:flutter/material.dart';

class AppColors {
  // Foundation
  static const Color foundationBlueDark = Color(0xFF1A1E25);

  // Neutral
  static const Color neutralGray0 = Color(0xFFFFFFFF);
  static const Color neutralGray600 = Color(0xFF475569);

  static const Color navGray = Color(0xFF7D7F88);
  static const Color buttonBorder = Color(0xFFE3E3E7);
  static const Color transparent = Color(0x00000000);
  static const Color textFieldBG = Color(0xFFF2F2F3);
  static const Color textFieldBGFocus = Color(0xFFF1F1FE);
  static const Color textFieldFocusBorder = Color(0xFF917AFD);
  static const Color captionText9E91DA = Color(0xFF9E91DA);
  static const Color orDividerColor = Color(0xFFEBE8F6);
  static const Color orContainerColor = Color(0xFFF3F0FF);
  static const Color errorColor = Color(0xFFEF4444);

  // Linear gradient
  static const Color primaryButtonLinearGradientFirst = Color(0xFF917AFD);
  static const Color primaryButtonLinearGradientSecond = Color(0xFF6246EA);
  static const LinearGradient primaryButtonLinearGradient = LinearGradient(
    colors: [
      primaryButtonLinearGradientFirst,
      primaryButtonLinearGradientSecond,
    ],
  );

  static const Color overlayOnboardingGradientFirst = Color(0x00FBFBFB);
  static const Color overlayOnboardingGradientSecond = Color(0xFFFCFCFC);

  static const LinearGradient overlayOnboardingGradient = LinearGradient(
    colors: [overlayOnboardingGradientFirst, overlayOnboardingGradientSecond],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.35],
  );
}
