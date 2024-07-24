import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Jonathan',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'Let\'s go shopping',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: ImageIcon(
            AssetImage(TAssetsPath.searchIcon),
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            // Define action for search icon
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage(TAssetsPath.noNotificationsIcon),
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            // Define action for notifications icon
          },
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
