import 'dart:async';
import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/filter_modal_bottom_sheet.dart';
import 'package:ecom_app/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationSearchWidget extends StatefulWidget {
  Timer? _debounce;
  final Function()? onTap;
  final Function(bool) onSearchStarted;
  final Function() onEditigComplete;
  final TextEditingController searchController;

  AnimationSearchWidget({
    super.key,
    required this.onTap,
    required this.onSearchStarted,
    required this.onEditigComplete,
    required this.searchController,
  });

  @override
  State<AnimationSearchWidget> createState() => _AnimationSearchWidgetState();
}

class _AnimationSearchWidgetState extends State<AnimationSearchWidget>
    with SingleTickerProviderStateMixin {
  late FocusNode _node;
  bool _focused = true;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node.addListener(setFocus);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 777),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _node.removeListener(setFocus);
    _animationController.dispose();
    widget._debounce?.cancel();
    super.dispose();
  }

  void setFocus() {
    setState(() {
      _focused = _node.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: TColors.cardWidgetBarierColor,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  widget.onTap!();
                  widget.searchController.clear();
                },
                icon: const ImageIcon(
                  AssetImage(TAssetsPath.backShevrone),
                  color: TColors.iconColor,
                  size: 30,
                ),
              ),
              Expanded(
                child: Container(
                  child: TextField(
                    focusNode: _node,
                    onSubmitted: onSearchChanged,
                    onChanged: (value) {
                      widget.onSearchStarted(true);
                      onSearchChanged(value);
                    },
                    autofocus: true,
                    controller: widget.searchController,
                    decoration: InputDecoration(
                      suffixIcon: _focused
                          ? const SizedBox.shrink()
                          : SizedBox(
                              width: 15,
                              height: 15,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Transform.scale(
                                    scale: 1.4,
                                    child: IconButton(
                                      onPressed: () => showFilteredBottom(
                                        context: context,
                                        onTap: onTap,
                                      ),
                                      icon: Image.asset(
                                        color: TColors.primaryColor,
                                        TAssetsPath.filterIcon,
                                      ),
                                    )),
                              ),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: SizedBox(
                        width: 15,
                        height: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Transform.scale(
                            scale: 1.4,
                            child: Image.asset(
                              color: TColors.primaryColor,
                              TAssetsPath.searchIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onEditingComplete: widget.onEditigComplete,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap({
    required RangeValues curValues,
    required String currentColor,
    required String currentLocation,
  }) {
    context.read<SearchBloc>().add(
          GetFilteredItemsEvent(
            maxPrice: curValues.end.round(),
            minPrice: curValues.start.round(),
            selectedColor: currentColor.toLowerCase(),
            selectedLocation: currentLocation,
          ),
        );
  }

  void onSearchChanged(String query) {
    if (widget._debounce?.isActive ?? false) widget._debounce?.cancel();
    widget._debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<SearchBloc>().add(GetSearchItemsEvent(query: query));
    });
  }
}
