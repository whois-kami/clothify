import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showFilteredBottom(BuildContext context) {
  RangeValues curValues = RangeValues(0, 197);
  String color = 'Black';

  showMaterialModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(42.0),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height * .6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(.35),
                  ),
                ),
                SizedBox(height: 10),
                Text('Filter by'),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Price'),
                    Spacer(),
                    Text(
                        '\$${curValues.start.round()} - \$${curValues.end.round()}'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbShape: SquareSpace(
                        enabledThumbSize: 20, disabledThumbSize: 10),
                  ),
                  child: RangeSlider(
                    values: curValues,
                    min: 0,
                    max: 197,
                    divisions: 197,
                    labels: RangeLabels(
                      '\$${curValues.start.round()}',
                      '\$${curValues.end.round()}',
                    ),
                    onChanged: (values) {
                      setState(() {
                        curValues = values;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Color'),
                    Spacer(),
                    Text(color),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class SquareSpace extends SliderComponentShape {
  const SquareSpace({
    this.enabledThumbSize = 20.0,
    required this.disabledThumbSize,
  });

  final double enabledThumbSize;
  final double disabledThumbSize;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    final double size = isEnabled ? enabledThumbSize : disabledThumbSize;
    return Size(size, size);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Tween<double> sizeTween = Tween<double>(
      begin: disabledThumbSize,
      end: enabledThumbSize,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final double size = sizeTween.evaluate(enableAnimation);
    final Rect squareRect = Rect.fromCenter(
      center: center,
      width: size,
      height: size,
    );

    canvas.drawRect(
      squareRect,
      Paint()..color = colorTween.evaluate(enableAnimation)!,
    );
  }
}
