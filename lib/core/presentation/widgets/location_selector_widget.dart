import 'package:flutter/material.dart';

class LocationSelectorWidget extends StatelessWidget {
  final String currentLocation;
  final String location;
  final double width;
  final double height;
  void Function()? onTap;
  LocationSelectorWidget({
    super.key,
    required this.onTap,
    required this.currentLocation,
    required this.location,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    bool isSeleted = location == currentLocation;
    return Row(
      children: [
        IntrinsicWidth(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: isSeleted
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.4),
                width: 0.5,
              ),
              color:
                  isSeleted ? const Color(0xFF514EB7) : const Color(0xFFFBFBFB),
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onTap,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Ink(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      location,
                      style: TextStyle(
                        color:
                            isSeleted ? Colors.white : const Color(0xFF514EB7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
