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

class _DashboardShellState extends State<DashboardShell>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isForward = true;
  late final AnimationController _controller;

  final List<Widget> _pages = const [
    HomePage(),
    ExplorePage(),
    ChatPage(),
    SavedPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FractionalTranslation(
              translation: Offset(
                _isForward
                    ? (1.0 - _controller.value)
                    : (_controller.value - 1.0),
                0.0,
              ),
              child: child,
            );
          },
          child: IndexedStack(index: _currentIndex, children: _pages),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          setState(() {
            _isForward = index > _currentIndex;
            _currentIndex = index;
          });
          _controller.forward(from: 0.0);
        },
      ),
    );
  }
}
