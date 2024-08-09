import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/tracking/presentation/bloc/tracking_bloc.dart';
import 'package:ecom_app/src/features/tracking/presentation/widgets/tracking_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _handleTabSelection(_tabController.index, context);
    });
    context.read<TrackingBloc>().add(GetCurrentOredersEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              TAppConstants.trackingScreenAppBarTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            pinned: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              onTap: (int index) => _handleTabSelection(index, context),
              physics: const NeverScrollableScrollPhysics(),
              tabs: const [
                Tab(text: TAppConstants.myOrderTab),
                Tab(text: TAppConstants.historyTab),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Color(0xFF7470C5)),
                insets: EdgeInsets.symmetric(horizontal: 70.0),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: BlocBuilder<TrackingBloc, TrackingState>(
              builder: (context, state) {
                if (state is TrackingLoaded) {
                  final items = state.items;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final currentItem = items[index];
                        return Column(
                          children: [
                            TrackingItemWidget(
                              trackingItemEntity: currentItem,
                            ),
                            const SizedBox(height: 15),
                          ],
                        );
                      },
                      childCount: items.length,
                    ),
                  );
                } else if (state is TrackingLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(
                    child: Text(TAppConstants.noOrdersFound),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleTabSelection(int index, BuildContext context) {
    if (index == 0) {
      context.read<TrackingBloc>().add(GetCurrentOredersEvent());
    } else if (index == 1) {
      context.read<TrackingBloc>().add(GetHistoryOredersEvent());
    }
  }
}
