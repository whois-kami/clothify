import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/article_widget.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class LeagalAndPolicesScreen extends StatelessWidget {
  const LeagalAndPolicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomSettingsAppBar(
        title: TAppConstants.leagalAndPoliciesAppBarTitle,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.0, top: 20),
        child: RawScrollbar(
          interactive: true,
          thumbColor: TColors.customPurple,
          radius: Radius.circular(20),
          thickness: 7,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ArticleWidget(
                    title: TAppConstants.articleTitle1,
                    subTitle: '${TAppConstants.textFish}\n',
                  ),
                  ArticleWidget(
                    title: TAppConstants.articleTitle2,
                    subTitle: '${TAppConstants.textFish}\n',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
