// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecom_app/src/features/home/presentation/widgets/animation_search_widget.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(bool) onOpenedChanged;
  final Function(bool) onSearchStarted;

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  HomeAppbar(
      {super.key,
      required this.onOpenedChanged,
      required this.onSearchStarted});
}

class _HomeAppbarState extends State<HomeAppbar> {
  bool _opened = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: _opened
          ? SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(),
            ),
      title: _opened
          ? SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Jonathan',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Let\'s go shopping',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
      actions: [
        AnimationSearchWidget(
          opened: _opened,
          onTap: _toggleOpened,
          onSearchStarted: (bool started) {
            widget.onSearchStarted(started);
          },
        ),
        _opened
            ? SizedBox.shrink()
            : IconButton(
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

  void _toggleOpened() {
    setState(() {
      _opened = !_opened;
      widget.onOpenedChanged(_opened);
      widget.onSearchStarted(false);
    });
  }
}
