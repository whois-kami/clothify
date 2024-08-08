import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/option_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(TTextConstants.settingsAppBarTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(TTextConstants.generalTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: TTextConstants.generalOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: TTextConstants.generalOptions[index]['icon'],
                        text: TTextConstants.generalOptions[index]['text'],
                        index: index,
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Text(TTextConstants.preferencesTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: TTextConstants.preferencesOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: TTextConstants.preferencesOptions[index]['icon'],
                        text: TTextConstants.preferencesOptions[index]['text'],
                        index: index + 5,
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
