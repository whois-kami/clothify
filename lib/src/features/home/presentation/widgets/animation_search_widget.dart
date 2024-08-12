// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/filter_modal_bottom_sheet.dart';
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationSearchWidget extends StatefulWidget {
  bool opened;
  Timer? _debounce;
  Function()? onTap;
  final Function(bool) onSearchStarted;

  AnimationSearchWidget({
    super.key,
    required this.opened,
    required this.onTap,
    required this.onSearchStarted,
  });

  @override
  State<AnimationSearchWidget> createState() => _AnimationSearchWidgetState();
}

class _AnimationSearchWidgetState extends State<AnimationSearchWidget> {
  late final TextEditingController _searchController;
  late FocusNode _node;
  bool _focused = true;

  @override
  void initState() {
    _searchController = TextEditingController();
    _node = FocusNode();
    _node.addListener(setFocus);

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _node.removeListener(setFocus);

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
    return Padding(
      padding:
          widget.opened ? const EdgeInsets.only(right: 30) : EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: widget.opened ? MediaQuery.sizeOf(context).width * 0.92 : 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
        ),
        child: widget.opened
            ? Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.onTap!();
                      _searchController.clear();
                    },
                    icon: const ImageIcon(
                      AssetImage(TAssetsPath.backShevrone),
                      color: TColors.iconColor,
                      size: 25,
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
                        controller: _searchController,
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
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
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
                        onEditingComplete: () {
                          context.read<HomeBloc>().add(AddLastSearchEvent(
                              query: _searchController.text));
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: widget.onTap,
                icon: const ImageIcon(
                  AssetImage(TAssetsPath.searchIcon),
                  color: TColors.iconColor,
                  size: 25,
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
    context.read<HomeBloc>().add(
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
      context.read<HomeBloc>().add(GetSearchItemsEvent(query: query));
    });
  }
}
