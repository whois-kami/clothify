import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const HomeAppbar({
    super.key,
  });
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: BlocBuilder<CoreBloc, CoreState>(
          buildWhen: (previous, current) {
            return current is ProfileLoaded;
          },
          builder: (context, state) {
            if (state is ProfileLoaded) {
              final user = state.user;
              final hasAvatar = user?.profileAvatarUrl.isNotEmpty ?? false;

              if (hasAvatar) {
                return Transform.scale(
                  scale: 1.2,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user!.profileAvatarUrl),
                  ),
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      title: BlocBuilder<CoreBloc, CoreState>(
        buildWhen: (previous, current) {
          return current is ProfileLoaded;
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final user = state.user;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${TAppConstants.hi} ${user?.name}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  TAppConstants.letsGoShopping,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      actions: [
        IconButton(
          onPressed: () => context.go('/root/search'),
          icon: const ImageIcon(
            AssetImage(TAssetsPath.searchIcon),
            color: TColors.iconColor,
            size: 25,
          ),
        ),
        IconButton(
          icon: const ImageIcon(
            AssetImage(TAssetsPath.noNotificationsIcon),
            color: TColors.iconColor,
            size: 25,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
