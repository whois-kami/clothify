import 'package:ecom_app/src/features/settings/presentation/widgets/option_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<Map<String, dynamic>> generalOptions = [
    {'icon': Icons.person, 'text': 'Edit Profile'},
    {'icon': Icons.lock, 'text': 'Change Password'},
    {'icon': Icons.notifications, 'text': 'Notifications'},
    {'icon': Icons.security, 'text': 'Security'},
    {'icon': Icons.language, 'text': 'Language', 'extra': 'English'},
  ];
  final List<Map<String, dynamic>> preferencesOptions = [
    {'icon': Icons.policy, 'text': 'Legal and Policies'},
    {'icon': Icons.help, 'text': 'Help & Support'},
    {'icon': Icons.logout, 'text': 'Logout', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('General',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: generalOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: generalOptions[index]['icon'],
                        text: generalOptions[index]['text'],
                        index: index,
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Preferences',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: preferencesOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      OptionWidget(
                        icon: preferencesOptions[index]['icon'],
                        text: preferencesOptions[index]['text'],
                        index: index,
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
