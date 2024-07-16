import 'package:ecom_app/src/features/favorites/presentation/widgets/cheaps_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Favorite'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: ImageIcon(
              AssetImage(TAssetsPath.noNotificationsIcon),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_location_alt,
                    size: 30,
                  ),
                  labelText: 'asdas',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  iconColor: Colors.black,
                  suffixIcon: const Icon(
                    Icons.abc,
                    size: 30,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 18),
              scrollDirection: Axis.horizontal,
              child: CheapsWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: 20,
                itemBuilder: (context, index) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
