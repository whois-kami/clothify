import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/user_data_field_widget.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final String name;
  final String email;
  const UserDataWidget({
    super.key,
    required this.email,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDataFieldWidget(
          title: TTextConstants.username1,
          subtitle: name,
          icon: TAssetsPath.personActive,
        ),
        const SizedBox(height: 15),
        UserDataFieldWidget(
          title: TTextConstants.emailOrPhoneNumber1,
          subtitle: email,
          icon: TAssetsPath.emailActive,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
