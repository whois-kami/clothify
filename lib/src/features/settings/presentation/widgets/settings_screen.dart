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
        title: const Text(TAppConstants.settingsAppBarTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(TAppConstants.generalTitle,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: TAppConstants.generalOptions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: TAppConstants.generalOptions[index]['icon'],
                        text: TAppConstants.generalOptions[index]['text'],
                        index: index,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(TAppConstants.preferencesTitle,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: TAppConstants.preferencesOptions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: TAppConstants.preferencesOptions[index]['icon'],
                        text: TAppConstants.preferencesOptions[index]['text'],
                        index: index + 5,
                      ),
                      const SizedBox(height: 10),
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
