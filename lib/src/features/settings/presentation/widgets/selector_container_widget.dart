import 'package:ecom_app/src/features/settings/presentation/widgets/select_item.dart';
import 'package:flutter/material.dart';

class SelectorContainerWidget extends StatefulWidget {
  final List<String> items;

  const SelectorContainerWidget({
    super.key,
    required this.items,
  });

  @override
  State<SelectorContainerWidget> createState() =>
      _SelectorContainerWidgetState();
}

class _SelectorContainerWidgetState extends State<SelectorContainerWidget> {
  List<bool> _toggleStates = [];

  @override
  void initState() {
    super.initState();
    _toggleStates = List<bool>.filled(widget.items.length, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.items.length, (index) {
          return ToggleItem(
            title: widget.items[index],
            value: _toggleStates[index],
            index: index,
            lastIndex: widget.items.length,
            onChanged: (value) {
              setState(() {
                _toggleStates[index] = value;
              });
            },
          );
        }),
      ),
    );
  }
}
