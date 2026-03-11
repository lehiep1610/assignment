import 'package:assignment/core/router/route_name.dart';
import 'package:assignment/features/auth/presentation/login/pages/login_page.dart';
import 'package:assignment/features/chat/presentation/pages/chat_page.dart';
import 'package:assignment/features/dashboard/presentation/pages/dashboard_shell.dart';
import 'package:assignment/features/explore/presentation/pages/explore_page.dart';
import 'package:assignment/features/home/presentation/pages/home_page.dart';
import 'package:assignment/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:assignment/features/profile/presentation/pages/profile_page.dart';
import 'package:assignment/features/saved/presentation/pages/saved_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onboarding:
        return _buildRoute(OnboardingPage(), settings);
      case RouteName.login:
        return _buildRoute(LoginPage(), settings);
      case RouteName.dashboard:
        return _buildRoute(DashboardShell(), settings);
      case RouteName.chat:
        return _buildRoute(ChatPage(), settings);
      case RouteName.explore:
        return _buildRoute(ExplorePage(), settings);
      case RouteName.saved:
        return _buildRoute(SavedPage(), settings);
      case RouteName.profile:
        return _buildRoute(ProfilePage(), settings);
      case RouteName.home:
        return _buildRoute(HomePage(), settings);
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
