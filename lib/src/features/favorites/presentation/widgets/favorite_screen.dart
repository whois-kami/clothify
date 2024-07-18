import 'package:ecom_app/core/constants/text_constants.dart';
import 'package:ecom_app/src/features/favorites/presentation/widgets/cheaps_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FocusNode _node;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node.addListener(setFocus);
  }

  @override
  void dispose() {
    _node.removeListener(setFocus);
    _node.dispose();
    super.dispose();
  }

  void setFocus() {
    setState(() {
      _focused = _node.hasFocus;
    });
  }

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
              TTextConstants.detailProduct,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Image.asset(
                    TAssetsPath.notificationsIcon,
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: TextField(
                maxLines: 1,
                focusNode: _node,
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    width: 15,
                    height: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Transform.scale(
                        scale: 0.8,
                        child: Image.asset(
                          color: const Color(0xFF343949),
                          TAssetsPath.searchIcon,
                        ),
                      ),
                    ),
                  ),
                  labelText: 'Search something',
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  iconColor: Colors.black,
                  suffixIcon: _focused
                      ? const SizedBox.shrink()
                      : SizedBox(
                          width: 15,
                          height: 15,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Transform.scale(
                              scale: 0.8,
                              child: Image.asset(
                                color: const Color(0xFF343949),
                                TAssetsPath.filterIcon,
                              ),
                            ),
                          ),
                        ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.only(left: 40, top: 13, bottom: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF504DB5),
                      width: 1.2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 18),
              scrollDirection: Axis.horizontal,
              child: CheapsWidget(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(),
                childCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
