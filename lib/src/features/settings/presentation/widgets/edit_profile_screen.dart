import 'dart:typed_data';

import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/services/image_picker.dart';
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/change_input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _userEmailController;
  Uint8List? _pickedImage;
  bool _isModMade = false;
  bool _isInitialDataLoaded = false;

  @override
  void initState() {
    debugPrint('profi');
    context.read<CoreBloc>().add(GetProfileEvent());
    _userNameController = TextEditingController();
    _userEmailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Image.asset(
            TAssetsPath.backShevrone,
            width: 30,
            height: 30,
          ),
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: Container(
            color: Colors.grey.withOpacity(0.15),
            height: 1.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.do_disturb_off,
            ),
          ),
        ],
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state is SettingsLoaded) {
            Navigator.of(context).pop();
            context.read<CoreBloc>().add(GetProfileEvent());
          }
        },
        child: BlocBuilder<CoreBloc, CoreState>(
          builder: (context, state) {
            if (state is CoreLoaded) {
              final user = state.user;
              if (user != null) {
                if (!_isInitialDataLoaded) {
                  _userNameController.text = user.name;
                  _userEmailController.text = user.email;
                  _isInitialDataLoaded = true;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              final pickedImageFile = await imagePicker();
                              if (pickedImageFile != null) {
                                setState(() {
                                  _pickedImage = pickedImageFile;
                                  _isModMade = true;
                                });
                              }
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: 50,
                               backgroundImage: _pickedImage != null
                                  ? MemoryImage(_pickedImage!)
                                  : NetworkImage(user.profileAvatarUrl)
                                      as ImageProvider,
                            ),
                          ),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ChangeInputFieldWidget(
                        titleContent: 'Username',
                        controller: _userNameController,
                        icon: TAssetsPath.personActive,
                        onChanged: _handleInputChange,
                        iconColor: const Color(0xFF5A56BB),
                      ),
                      const SizedBox(height: 20),
                      ChangeInputFieldWidget(
                        titleContent: 'Email or phone number',
                        controller: _userEmailController,
                        icon: TAssetsPath.emailActive,
                        onChanged: _handleInputChange,
                        iconColor: const Color(0xFF5A56BB),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                      _isModMade
                          ? ElvButtonWidget(
                              textContent: 'Save Changes',
                              onPressed: () {
                                context.read<SettingsBloc>().add(
                                      UpdateProfilePhotoEvent(
                                        imageBytes: _pickedImage,
                                        name: _userNameController.text,
                                        email: _userEmailController.text,
                                      ),
                                    );
                                _isModMade == false;
                              })
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong... no user found}'),
                );
              }
            } else if (state is CoreLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CoreFailure) {
              return Center(
                child: Text('Something went wrong... ${state.message}'),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void _handleInputChange(bool isChanged) {
    setState(() {
      _isModMade = isChanged;
    });
  }
}
