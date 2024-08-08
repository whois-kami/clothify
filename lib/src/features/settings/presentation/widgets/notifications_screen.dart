import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/custom_appbar.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/selector_container_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomSettingsAppBar(
        title: TTextConstants.notificationsAppBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            SelectorContainerWidget(
              items: TTextConstants.notificationOptions,
            ),
          ],
        ),
      ),
    );
  }
}
