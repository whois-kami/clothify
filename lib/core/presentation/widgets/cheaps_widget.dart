import 'package:flutter/material.dart';

class CheapsWidget extends StatefulWidget {
  final void Function(String chip) onSelected;
  final List<String> selectedCheaps;
  @override
  _CheapsWidgetState createState() => _CheapsWidgetState();
  const CheapsWidget({
    super.key,
    required this.onSelected,
    required this.selectedCheaps,
  });
}

class _CheapsWidgetState extends State<CheapsWidget> {
  List<String> cheapsText = const [
    'All',
    'Latest',
    'Most Popular',
    'Cheapest',
    'Dearest',
  ];

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
                      color: widget.selectedCheaps.contains(chip)
                          ? const Color(0xFF514EB7)
                          : Colors.black.withOpacity(0.1),
                    ),
                    selectedColor: const Color(0xFF514EB7),
                    selected: widget.selectedCheaps.contains(chip),
                    label: Text(
                      chip,
                      style: TextStyle(
                        color: widget.selectedCheaps.contains(chip)
                            ? Colors.white
                            : Colors.black.withOpacity(0.6),
                      ),
                    ),
                    onSelected: (_) => widget.onSelected(chip),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
