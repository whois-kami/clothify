import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomSettingsAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Image.asset(
          TAssetsPath.backShevrone,
          width: 30,
          height: 30,
        ),
      ),
      title: Text(title),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(15.0),
        child: Container(
          color: Colors.grey.withOpacity(0.15),
          height: 1.5,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.do_disturb_off,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15.0);
}
