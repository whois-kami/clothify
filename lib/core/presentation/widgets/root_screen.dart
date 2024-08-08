import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/favorite/presentation/widgets/favorite_screen.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/home_screen.dart';
import 'package:ecom_app/src/features/tracking/presentation/widgets/tracking_screen.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_path_constants.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const TrackingScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        _pages.removeAt(0);
        _pages.insert(0, HomeScreen(key: UniqueKey()));
        break;
      case 1:
        _pages.removeAt(1);
        _pages.insert(1, TrackingScreen(key: UniqueKey()));
        break;
      case 2:
        _pages.removeAt(2);
        _pages.insert(2, FavoriteScreen(key: UniqueKey()));
        break;
      case 3:
        _pages.removeAt(3);
        _pages.insert(3, ProfileScreen(key: UniqueKey()));
        break;
    }
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: _buildBottomNavBarItems,
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
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
                  TTextConstants.homeIcon,
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
                  TTextConstants.homeIcon,
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
                  TTextConstants.orderIcon,
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
                  TTextConstants.orderIcon,
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
                  TTextConstants.favoriteIcon,
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
                  TTextConstants.favoriteIcon,
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
                  TTextConstants.profileIcon,
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
                  TTextConstants.profileIcon,
                  style: TextStyle(fontSize: 12, color: Color(0XFF6952A5)),
                ),
              ],
            ),
          ),
          label: '',
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
