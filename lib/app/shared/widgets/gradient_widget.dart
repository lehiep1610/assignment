import 'package:assignment/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum _GradientWidgetType { text, icon }

class GradientWidget extends StatelessWidget {
  final LinearGradient gradient;
  final _GradientWidgetType _type;

  final String? text;
  final TextStyle? textStyle;

  final String? iconPath;
  final double? size;

  const GradientWidget.text({
    super.key,
    required this.gradient,
    required String this.text,
    required TextStyle this.textStyle,
  }) : _type = _GradientWidgetType.text,
       iconPath = null,
       size = null;

  const GradientWidget.icon({
    super.key,
    required this.gradient,
    required String this.iconPath,
    required double this.size,
  }) : _type = _GradientWidgetType.icon,
       text = null,
       textStyle = null;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child:
          _type == _GradientWidgetType.text
              ? Text(text!, style: textStyle)
              : SvgPicture.asset(
                iconPath!,
                width: size,
                height: size,
                colorFilter: ColorFilter.mode(
                  AppColors.neutralGray0,
                  BlendMode.srcIn,
                ),
              ),
    );
  }
}
