import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/filter_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class FavoriteTextFieldWidget extends StatefulWidget {
  final void Function(
      {required RangeValues curValues,
      required String currentColor,
      required String currentLocation}) onTap;
  final FocusNode? node;
  bool focused;
  FavoriteTextFieldWidget({
    super.key,
    required this.onTap,
    required this.node,
    required this.focused,
  });
  @override
  State<FavoriteTextFieldWidget> createState() =>
      _FavoriteTextFieldWidgetState();
}

class _FavoriteTextFieldWidgetState extends State<FavoriteTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      focusNode: widget.node,
      decoration: InputDecoration(
        prefixIcon: SizedBox(
          width: 15,
          height: 15,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 18),
            child: Transform.scale(
              scale: 5.0,
              child: Image.asset(
                color: TColors.primaryColor,
                TAssetsPath.searchIcon,
              ),
            ),
          ),
        ),
        labelText: TTextConstants.searchSomething,
        labelStyle:
            TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        iconColor: TColors.iconColor,
        suffixIcon: widget.focused
            ? const SizedBox.shrink()
            : SizedBox(
                width: 15,
                height: 15,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Transform.scale(
                    scale: 1.4,
                    child: IconButton(
                      onPressed: () => showFilteredBottom(
                        context: context,
                        onTap: widget.onTap,
                      ),
                      icon: Image.asset(
                        color: TColors.primaryColor,
                        TAssetsPath.filterIcon,
                      ),
                    ),
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.only(left: 40, top: 13, bottom: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TColors.subtleBlack.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TColors.customPurple,
            width: 1.2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
