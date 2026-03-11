import 'package:assignment/app/theme/app_theme.dart';
import 'package:assignment/core/router/app_router.dart';
import 'package:assignment/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      theme: AppTheme.light,
      home: OnboardingPage(),
    );
  }
}
