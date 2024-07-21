import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assets_path_constants.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: _buildBottomNavBarItems,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.homeNavBarIcon),
                  color: Colors.black,
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          activeIcon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.activeHomeNavBarIcon),
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 12, color: Color(0XFF6952A5)),
                ),
              ],
            ),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.deliveryNavBarIcon),
                  color: Colors.black,
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Order',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          activeIcon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.activeDeliveryNavBarIcon),
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Order',
                  style: TextStyle(fontSize: 12, color: Color(0XFF6952A5)),
                ),
              ],
            ),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.heartNavBarIcon),
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Favorite',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          activeIcon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.activeHeartNavBarIcon),
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Favorite',
                  style: TextStyle(fontSize: 12, color: Color(0XFF6952A5)),
                ),
              ],
            ),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.profileNavBarIcon),
                  color: Colors.black,
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          activeIcon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  AssetImage(TAssetsPath.activeProfileNavBarIcon),
                  size: 23,
                ),
                SizedBox(height: 5),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 12, color: Color(0XFF6952A5)),
                ),
              ],
            ),
          ),
          label: '',
        ),
      ];

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
