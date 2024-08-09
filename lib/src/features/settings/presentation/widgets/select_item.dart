import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final int index;
  final int lastIndex;

  const ToggleItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.index,
    required this.lastIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(title),
                trailing: Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    activeTrackColor: const Color(0xFF514EB7),
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.transparent,
                    trackOutlineColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.2)),
                    trackOutlineWidth: const WidgetStatePropertyAll(1.7),
                    inactiveThumbColor: Colors.black.withOpacity(0.2),
                    value: value,
                    onChanged: onChanged,
                  ),
                ),
              ),
              index != lastIndex - 1
                  ? Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.2),
                    )
                  : const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
