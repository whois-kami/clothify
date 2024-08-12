import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/favorite/presentation/widgets/favorite_screen.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/home_screen.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/search_screen.dart';
import 'package:ecom_app/src/features/tracking/presentation/widgets/tracking_screen.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_path_constants.dart';

class RootScreen extends StatefulWidget {
  final int initialIndex;
  const RootScreen({
    super.key,
    required this.initialIndex,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const TrackingScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
    const SearchScreen(showTags: false),
  ];
  @override
  Widget build(BuildContext context) {
    switch (_selectedIndex) {
      case 4:
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
      case 0:
        _pages.removeAt(4);
        _pages.insert(
            4,
            SearchScreen(
              key: UniqueKey(),
              showTags: false,
            ));
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
                  TAppConstants.homeIcon,
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
                  TAppConstants.homeIcon,
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
                  TAppConstants.orderIcon,
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
                  TAppConstants.orderIcon,
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
                  TAppConstants.favoriteIcon,
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
                  TAppConstants.favoriteIcon,
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
                  TAppConstants.profileIcon,
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
                  TAppConstants.profileIcon,
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
      if (_selectedIndex == index) {
        switch (index) {
          case 0:
            _pages[0] = HomeScreen(key: UniqueKey());
            break;
          case 1:
            _pages[1] = TrackingScreen(key: UniqueKey());
            break;
          case 2:
            _pages[2] = FavoriteScreen(key: UniqueKey());
            break;
          case 3:
            _pages[3] = ProfileScreen(key: UniqueKey());
            break;
          case 4:
            _pages[4] = SearchScreen(key: UniqueKey(), showTags: false);
            break;
        }
      }
      _selectedIndex = index;
    });
  }
}
