import 'package:flutter/material.dart';

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
          ),
        ],
      ),
    );
  }
}
