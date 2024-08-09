import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/animation_search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(bool) onOpenedChanged;
  final Function(bool) onSearchStarted;

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const HomeAppbar({
    super.key,
    required this.onOpenedChanged,
    required this.onSearchStarted,
  });
}

class _HomeAppbarState extends State<HomeAppbar> {
  bool _opened = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: _opened
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: BlocBuilder<CoreBloc, CoreState>(
                builder: (context, state) {
                  if (state is CoreLoaded) {
                    final UserEntity? user = state.user;
                    return Transform.scale(
                      scale: 1.2,
                      child: CircleAvatar(
                        backgroundImage: user?.profileAvatarUrl != null
                            ? NetworkImage(user!.profileAvatarUrl)
                            : const AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                      ),
                    );
                  }
                  return CircleAvatar();
                },
              ),
            ),
      title: _opened
          ? const SizedBox.shrink()
          : BlocBuilder<CoreBloc, CoreState>(
              builder: (context, state) {
                if (state is CoreLoaded) {
                  final user = state.user;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${TTextConstants.hi} ${user?.name}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        TTextConstants.letsGoShopping,
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
        AnimationSearchWidget(
          opened: _opened,
          onTap: _toggleOpened,
          onSearchStarted: (bool started) {
            widget.onSearchStarted(started);
          },
        ),
        _opened
            ? const SizedBox.shrink()
            : IconButton(
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

  void _toggleOpened() {
    setState(() {
      _opened = !_opened;
      widget.onOpenedChanged(_opened);
      widget.onSearchStarted(false);
    });
  }
}
