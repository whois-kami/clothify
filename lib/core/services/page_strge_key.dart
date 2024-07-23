import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  final Widget child;
  final String keyValue;

  const StatefulPage({
    super.key,
    required this.child,
    required this.keyValue,
  });

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: PageStorageKey(widget.keyValue),
      child: widget.child,
    );
  }
}
