import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/presentation/widgets/snackbar_messages.dart';
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/change_input_field_widget.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isPasswordVisibleFirst = true;
  bool isPasswordVisibleSecond = true;
  bool _isMadeChanges = false;
  late final TextEditingController _firstPasswordConroller;
  late final TextEditingController _secondPasswordConroller;

  @override
  void initState() {
    _firstPasswordConroller = TextEditingController();
    _secondPasswordConroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomSettingsAppBar(
        title: TTextConstants.changePasswordAppBarTitle,
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLoaded) {
            successMessage(
                context: context,
                content: TTextConstants.passwordChangeSuccess);
          } else if (state is SettingsFailure) {
            errorMessage(
                context: context,
                content:
                    '${TTextConstants.passwordChangeError1} ${state.message}');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ChangeInputFieldWidget(
                titleContent: TTextConstants.newPasswordTitle,
                controller: _firstPasswordConroller,
                icon: TAssetsPath.lockIcon,
                onChanged: _handleInputChange,
                visibleEyeIcon: TAssetsPath.visibleEyeIcon,
                noVisibleEyeIcon: TAssetsPath.noVisibleEyeIcon,
                iconColor: Colors.grey,
              ),
              const SizedBox(height: 15),
              ChangeInputFieldWidget(
                titleContent: TTextConstants.confirmPasswordTitle,
                controller: _secondPasswordConroller,
                icon: TAssetsPath.lockIcon,
                onChanged: _handleInputChange,
                visibleEyeIcon: TAssetsPath.visibleEyeIcon,
                noVisibleEyeIcon: TAssetsPath.noVisibleEyeIcon,
                iconColor: Colors.grey,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.45),
              _isMadeChanges
                  ? ElvButtonWidget(
                      textContent: TTextConstants.changeNowButton,
                      onPressed: _onButtonPressed)
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  void _handleInputChange(bool isChanged) {
    setState(() {
      if (_firstPasswordConroller.text.isNotEmpty &&
          _secondPasswordConroller.text.isNotEmpty) {
        _isMadeChanges = true;
      } else {
        _isMadeChanges = false;
      }
    });
  }

  void _onButtonPressed() {
    if (_firstPasswordConroller.text != _secondPasswordConroller.text) {
      errorMessage(
          context: context, content: TTextConstants.passwordMismatchError);
    } else {
      context
          .read<SettingsBloc>()
          .add(ChangePasswordEvent(newPassword: _firstPasswordConroller.text));
    }
  }
}
