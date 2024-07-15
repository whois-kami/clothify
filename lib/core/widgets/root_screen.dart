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
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        backgroundColor: Colors.white,
        items: _buildBottomNavBarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/house-blank.png'),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage('assets/images/house-blank_active.png'),
            size: 20,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/delivery.png'),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage('assets/images/delivery_active.png'),
            size: 20,
          ),
          label: 'Order',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/heart.png'),
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage('assets/images/heart_active.png'),
            size: 20,
          ),
          label: 'Favorite',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/profile.png'),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage('assets/images/profile_active.png'),
            size: 20,
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
