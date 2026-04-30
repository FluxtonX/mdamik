import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mdamik/features/chat/presentation/chat_list_view.dart';
import 'package:mdamik/features/profile/presentation/profile_view.dart';

import 'home_view.dart';
import 'projects_view.dart';

class MainNavView extends StatefulWidget {
  const MainNavView({super.key});

  static const routeName = '/home/main';

  @override
  State<MainNavView> createState() => _MainNavViewState();
}

class _MainNavViewState extends State<MainNavView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const ProjectsView(),
    const ChatListView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF28B22),
        unselectedItemColor: Colors.black26,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n?.navHome ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business_center_outlined),
            activeIcon: const Icon(Icons.business_center),
            label: l10n?.navProjects ?? 'Projects',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            activeIcon: const Icon(Icons.chat_bubble),
            label: l10n?.navChat ?? 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: l10n?.navProfile ?? 'Profile',
          ),
        ],
      ),
    );
  }
}
