import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Image.asset(
                    TAssetsPath.settigns,
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () => context.go('/root/settings'),
                ),
              ),
            ],
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: MediaQuery.sizeOf(context).height * 0.05,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: CircleAvatar(
              radius: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: UserDataWidget(
                email: 'asss@gmail.com',
                name: 'Vladimir Stoyakovski',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
