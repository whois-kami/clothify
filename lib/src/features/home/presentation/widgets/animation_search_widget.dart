// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationSearchWidget extends StatefulWidget {
  bool opened;
  Timer? _debounce;
  Function()? onTap;
  AnimationSearchWidget({
    super.key,
    required this.opened,
    required this.onTap,
  });

  @override
  State<AnimationSearchWidget> createState() => _AnimationSearchWidgetState();
}

class _AnimationSearchWidgetState extends State<AnimationSearchWidget> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    widget._debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.opened ? const EdgeInsets.only(right: 48) : EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: widget.opened ? MediaQuery.sizeOf(context).width * .86 : 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
        ),
        child: widget.opened
            ? Row(
                children: [
                  IconButton(
                    onPressed: widget.onTap,
                    icon: ImageIcon(
                      AssetImage(TAssetsPath.backShevrone),
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        onChanged: onSearchChanged,
                        autofocus: true,
                        controller: _searchController,
                        decoration: InputDecoration(
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
                                  color: const Color(0xFF343949),
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
                icon: ImageIcon(
                  AssetImage(TAssetsPath.searchIcon),
                  color: Colors.black,
                  size: 25,
                ),
              ),
      ),
    );
  }

  onSearchChanged(String query) {
    if (widget._debounce?.isActive ?? false) widget._debounce?.cancel();
    widget._debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<HomeBloc>().add(GetSearchItemsEvent(query: query));
    });
  }
}
