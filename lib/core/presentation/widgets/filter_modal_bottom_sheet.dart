import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/widgets/color_selector_widget.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/presentation/widgets/location_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showFilteredBottom({
  required BuildContext context,
  required void Function({
    required RangeValues curValues,
    required String currentColor,
    required String currentLocation,
  }) onTap,
}) {
 
  
  RangeValues curValues = RangeValues(0, 197);
  String currentColor = 'Black';
  String currentLocation = 'San Diego';

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
        return SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.withOpacity(.35),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(child: Text(TTextConstants.filterBy)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(TTextConstants.price),
                    Spacer(),
                    Text(
                        '\$${curValues.start.round()} - \$${curValues.end.round()}'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
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
                    Text(TTextConstants.color),
                    Spacer(),
                    Text(currentColor),
                  ],
                ),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: TTextConstants.colors.entries.map((entry) {
                      return ColorSelectorWidget(
                        width: 30,
                        height: 30,
                        onTap: () {
                          setState(() {
                            currentColor = entry.value;
                          });
                        },
                        currentColor: currentColor,
                        circleColor: entry.key,
                        circleColorString: entry.value,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 25),
                Text(TTextConstants.location),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: TTextConstants.locations.map((location) {
                      return LocationSelectorWidget(
                        onTap: () {
                          setState(() {
                            currentLocation = location;
                          });
                        },
                        currentLocation: currentLocation,
                        location: location,
                        height: 43,
                        width: 100,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .07,
                ),
                ElvButtonWidget(
                    textContent: TTextConstants.applyFilter,
                    onPressed: () {
                      onTap(
                        curValues: curValues,
                        currentColor: currentColor,
                        currentLocation: currentLocation,
                      );
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        );
      },
    ),
  );
}
