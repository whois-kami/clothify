import 'package:flutter/material.dart';

class CheapsWidget extends StatefulWidget {
  @override
  _CheapsWidgetState createState() => _CheapsWidgetState();
}

class _CheapsWidgetState extends State<CheapsWidget> {
  List<String> cheapsText = const [
    'All',
    'Latest',
    'Most Popular',
    'Cheapest',
    'Dearest',
  ];

  List<String> temp = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 8,
          children: cheapsText
              .map((chip) => FilterChip(
                    showCheckmark: false,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    side: BorderSide(
                      color: temp.contains(chip)
                          ? const Color(0xFF514EB7)
                          : Colors.black.withOpacity(0.1),
                    ),
                    selectedColor: const Color(0xFF514EB7),
                    selected: temp.contains(chip),
                    label: Text(
                      chip,
                      style: TextStyle(
                        color: temp.contains(chip)
                            ? Colors.white
                            : Colors.black.withOpacity(0.6),
                      ),
                    ),
                    onSelected: (value) {
                      setState(() {
                        if (temp.contains(chip)) {
                          temp.remove(chip);
                        } else {
                          temp.add(chip);
                        }
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
