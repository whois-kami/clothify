import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: _buildBottomNavBarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.bubble_chart,
            color: Colors.black,
          ),
          label: 'My order',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          label: 'Favorite',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
      ];

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
