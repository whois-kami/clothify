import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/logout_alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  const OptionWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        switch (index) {
          case 0:
            context.go('/root/settings/editProfile');
            break;
          case 1:
            context.go('/root/settings/changePassword');
            break;
          case 2:
            context.go('/root/settings/notifications');
            break;
          case 3:
            context.go('/root/settings/security');
            break;
          case 4:
            context.go('/root/settings/language');
            break;
          case 5:
            context.go('/root/settings/legalAndPolicies');
            break;
          case 6:
            context.go('/root/settings/helpAndSupport');
            break;
          case 7:
            showLogOutDialog(context);
          default:
            debugPrint('Index not recognized');
        }
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: TColors.whiteBg,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(0, 1),
              blurRadius: 30,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(1, 0),
              blurRadius: 30,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: index == 7 ? TColors.redIconColor : TColors.iconColor,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                    color:
                        index == 7 ? TColors.redIconColor : TColors.iconColor),
              ),
              const Spacer(),
              index == 7
                  ? const SizedBox.shrink()
                  : const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
