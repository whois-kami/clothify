import 'dart:async';

import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountSelecterWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;
  final int productId;
  final int count;
  Timer? _debounce;

  CountSelecterWidget({
    super.key,
    this.width = 98.0,
    this.height = 38.0,
    this.iconHeight = 25.0,
    this.iconWidth = 25.0,
    required this.productId,
    required this.count,
  });

  void _onDecrement(BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context
          .read<CoreBloc>()
          .add(DecrementCountProductEvent(productId: productId.toString()));
    });
  }

  void _onIncrement(BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context
          .read<CoreBloc>()
          .add(IncrementCountProductEvent(productId: productId.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onDecrement(context),
            child: Image.asset(
              TAssetsPath.minusIcon,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
          Text(count.toString()),
          InkWell(
            onTap: () => _onIncrement(context),
            child: Image.asset(
              TAssetsPath.plusIcon,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
        ],
      ),
    );
  }
}
