import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/core/router/app_router.dart';
import 'package:assignment/features/auth/presentation/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => AppRouter.pop(context),
          icon: SvgPicture.asset(AssetPaths.arrowLeft),
        ),
        backgroundColor: AppColors.neutralGray0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.horizontalPage,
              vertical: AppPaddings.verticalPage,
            ),
            child: Column(children: [LoginForm()]),
          ),
        ),
      ),
    );
  }
}
