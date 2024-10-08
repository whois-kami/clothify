import 'package:ecom_app/core/constants/app_constants.dart';
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 8,
          children: TAppConstants.cheapsText
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
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.titleSmall!.fontWeight,
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
