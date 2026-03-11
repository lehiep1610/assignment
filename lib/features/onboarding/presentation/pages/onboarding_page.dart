import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/core/router/app_router.dart';
import 'package:assignment/core/router/route_name.dart';
import 'package:assignment/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:assignment/features/onboarding/presentation/widgets/onboarding_image_grid.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _onTapLoginButton(BuildContext context) {
    AppRouter.navigateTo(context, RouteName.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.horizontalPage,
            vertical: AppPaddings.verticalPage,
          ),
          child: Stack(
            children: [
              OnboardingImageGrid(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: OnboardingContent(
                  onTapLoginButton: () => _onTapLoginButton(context),
                  onTapSignupButton: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
