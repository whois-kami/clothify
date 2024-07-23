import 'package:ecom_app/core/constants/text_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/src/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/category_filler_widget.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/home_appbar.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/home_filler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetNewArrivalsEvent());
    context.read<CoreBloc>().add(SyncWithDBEvent());
    super.initState();
  }

  void _handleTabSelection(int index) {
    if (index == 0) {
      context.read<HomeBloc>().add(GetNewArrivalsEvent());
    } else if (index == 1) {
      context.read<HomeBloc>().add(GetAllCategoriesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoreBloc, CoreState>(
      listener: (context, state) {
        if (state is CoreLoaded) {
          context.read<FavoriteBloc>().add(GetFavoritesProducts());
        }
      },
      child: Scaffold(
        appBar: HomeAppbar(),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TabBar(
                onTap: (int index) => _handleTabSelection(index),
                physics: const NeverScrollableScrollPhysics(),
                tabs: const [
                  Tab(text: TTextConstants.tabHome),
                  Tab(text: TTextConstants.tabCategory),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Color(0xFF7470C5)),
                  insets: EdgeInsets.symmetric(horizontal: 70.0),
                ),
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoaded) {
                      final hasProducts =
                          state.products != null && state.products!.isNotEmpty;
                      final hasCategories = state.categories != null &&
                          state.categories!.isNotEmpty;

                      return TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          hasProducts
                              ? HomeFillerWidget(products: state.products!)
                              : const Center(
                                  child:
                                      Text(TTextConstants.noAviableProducts)),
                          hasCategories
                              ? CategoryFillerWidget(
                                  categories: state.categories!)
                              : const Center(
                                  child:
                                      Text(TTextConstants.noAviableCategories)),
                        ],
                      );
                    } else if (state is HomeFailure) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
