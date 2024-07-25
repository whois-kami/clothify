import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/presentation/widgets/input_field_widget.dart';
import 'package:ecom_app/core/presentation/widgets/product_card_widget.dart';
import 'package:ecom_app/core/services/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailNameController;

  @override
  void initState() {
    _userNameController = TextEditingController(text: 'aboba Abobovich');
    _emailNameController = TextEditingController(text: 'email emailovich');
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    final bytesPhoto = imagePicker();
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),
                Positioned(
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
            SizedBox(height: 15),
            CstInputFiled(
              titleContent: 'Username',
              isPassword: false,
              isPasswordVisible: false,
              textContent: _userNameController.text,
              pathToIcon: TAssetsPath.personActive,
              controller: _userNameController,
            ),
            SizedBox(height: 15),
            CstInputFiled(
              titleContent: 'Email or phone number',
              isPassword: false,
              isPasswordVisible: false,
              textContent: _emailNameController.text,
              pathToIcon: TAssetsPath.emailActive,
              controller: _emailNameController,
            ),
          ],
        ),
      ),
    );
  }
}
