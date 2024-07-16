import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/assets_path_constants.dart';

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
            AssetImage(TAssetsPath.homeNavBarIcon),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage(TAssetsPath.activeHomeNavBarIcon),
            size: 20,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(TAssetsPath.deliveryNavBarIcon),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage(TAssetsPath.activeDeliveryNavBarIcon),
            size: 20,
          ),
          label: 'Order',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(TAssetsPath.heartNavBarIcon),
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage(TAssetsPath.activeHeartNavBarIcon),
            size: 20,
          ),
          label: 'Favorite',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(TAssetsPath.profileNavBarIcon),
            color: Colors.black,
            size: 20,
          ),
          activeIcon: ImageIcon(
            AssetImage(TAssetsPath.activeHomeNavBarIcon),
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
