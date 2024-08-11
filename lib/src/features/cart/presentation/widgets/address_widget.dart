import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String? address;
  const AddressWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        address ?? 'Fetching Address',
        maxLines: 5,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
