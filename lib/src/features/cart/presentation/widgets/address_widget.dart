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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address != null ? 'Home' : '',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 15),
          Text(
            address ?? 'Fetching Address',
            maxLines: 3,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ],
      ),
    );
  }
}
