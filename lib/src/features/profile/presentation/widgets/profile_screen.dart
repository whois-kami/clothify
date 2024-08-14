import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<CoreBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoreBloc, CoreState>(
        builder: (context, state) {
          if (state is CoreLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoreFailure) {
            return Center(
              child: Text('${TAppConstants.somethingError} ${state.message}'),
            );
          } else if (state is CoreLoaded) {
            final user = state.user;
            if (user != null) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: false,
                    automaticallyImplyLeading: false,
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      TAppConstants.profile,
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
                      foregroundImage:
                          NetworkImage(user.profileAvatarUrl) as ImageProvider,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: UserDataWidget(
                        email: user.email,
                        name: user.name,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text(TAppConstants.tryAgain));
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
