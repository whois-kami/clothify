// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class PromoTextFieldWidget extends StatefulWidget {
  final TextEditingController promoController;

  const PromoTextFieldWidget({
    super.key,
    required this.promoController,
  });

  @override
  State<PromoTextFieldWidget> createState() => _PromoTextFieldWidgetState();
}

class _PromoTextFieldWidgetState extends State<PromoTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.promoController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF3F3F3),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: TColors.greyBorder.withOpacity(0.4),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: TColors.greyBorder.withOpacity(0.4),
            width: 0.5,
          ),
        ),
        prefixIcon: SizedBox(
          width: 15,
          height: 15,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Transform.scale(
              scale: 1.4,
              child: const Icon(Icons.abc),
            ),
          ),
        ),
        suffixIcon: SizedBox(
          width: 15,
          height: 15,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Transform.scale(
              scale: 1.4,
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ),
    );
  }
}
