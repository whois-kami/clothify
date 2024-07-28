// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String language;
  final String iconLanguage;
  String selectedLanguage;
  void Function()? onTap;
  LanguageSelector({
    super.key,
    required this.language,
    required this.iconLanguage,
    required this.selectedLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1.5,
            color: selectedLanguage == language
                ? Color(0xFF514EB7)
                : Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Image.asset(
                iconLanguage,
                width: 30,
                height: 30,
              ),
              SizedBox(width: 15),
              Text(language),
              Spacer(),
              if (selectedLanguage == language)
                Icon(Icons.check, color: Color(0xFF514EB7)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
