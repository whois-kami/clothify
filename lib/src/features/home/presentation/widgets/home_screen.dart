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
    super.initState();
    context.read<HomeBloc>().add(GetNewArrivalsEvent());
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
    return Scaffold(
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
                Tab(text: 'Home'),
                Tab(text: 'Category'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.purple,
              indicatorWeight: 2.0,
              dividerColor: Colors.transparent,
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
                                child: Text('No products available')),
                        hasCategories
                            ? CategoryFillerWidget(
                                categories: state.categories!)
                            : const Center(
                                child: Text('No categories available')),
                      ],
                    );
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
