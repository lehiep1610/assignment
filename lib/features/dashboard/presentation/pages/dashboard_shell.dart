import 'package:assignment/features/chat/presentation/pages/chat_page.dart';
import 'package:assignment/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:assignment/features/explore/presentation/pages/explore_page.dart';
import 'package:assignment/features/home/presentation/pages/home_page.dart';
import 'package:assignment/features/profile/presentation/pages/profile_page.dart';
import 'package:assignment/features/saved/presentation/pages/saved_page.dart';
import 'package:flutter/material.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ExplorePage(),
    ChatPage(),
    SavedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
