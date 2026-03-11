import 'package:assignment/core/router/route_name.dart';
import 'package:assignment/features/auth/presentation/login/pages/login_page.dart';
import 'package:assignment/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onboarding:
        return _buildRoute(OnboardingPage(), settings);
      case RouteName.login:
        return _buildRoute(LoginPage(), settings);
      default:
        return _buildRoute(OnboardingPage(), settings);
    }
  }

  static Route<dynamic> _buildRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  static void navigateTo(
    BuildContext context,
    String routeName, [
    Object? argument,
  ]) {
    Navigator.pushNamed(context, routeName, arguments: argument);
  }

  static void navigateToAndReplace(
    BuildContext context,
    String routeName, [
    Object? argument,
  ]) {
    Navigator.pushReplacementNamed(context, routeName, arguments: argument);
  }

  static void naviageteToAndRemoveUntil(
    BuildContext context,
    String routeName, [
    Object? argument,
  ]) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: argument,
    );
  }

  static void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
