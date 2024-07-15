import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            AssetImage('assets/images/search.png'),
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            // Define action for search icon
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/images/bell.png'),
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
