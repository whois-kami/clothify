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

  HomeAppbar({
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
          ? SizedBox.shrink()
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
                  return CircleAvatar(); // Default avatar or loading indicator
                },
              ),
            ),
      title: _opened
          ? SizedBox.shrink()
          : BlocBuilder<CoreBloc, CoreState>(
              builder: (context, state) {
                if (state is CoreLoaded) {
                  final user = state.user;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${user?.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Let\'s go shopping',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
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
