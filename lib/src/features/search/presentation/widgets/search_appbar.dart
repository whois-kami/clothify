import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/src/features/search/presentation/widgets/animation_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(bool) onSearchStarted;

  @override
  State<SearchAppBar> createState() => _SearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const SearchAppBar({
    super.key,
    required this.onSearchStarted,
  });
}

class _SearchAppbarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      backgroundColor: TColors.whiteBg,
      surfaceTintColor: TColors.cardWidgetBarierColor,
      title: AnimationSearchWidget(
        onTap: () => context.pop(),
        onSearchStarted: widget.onSearchStarted,
      ),
    );
  }
}
