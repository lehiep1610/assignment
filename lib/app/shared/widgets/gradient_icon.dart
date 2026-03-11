import 'package:assignment/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final LinearGradient gradient;
  const GradientIcon({
    super.key,
    required this.gradient,
    required this.iconPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SvgPicture.asset(
        iconPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(AppColors.neutralGray0, BlendMode.srcIn),
      ),
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
    );
  }
}
