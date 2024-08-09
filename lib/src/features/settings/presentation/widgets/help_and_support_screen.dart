import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomSettingsAppBar(
        title: TAppConstants.helpAndSupportAppBarTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            for (var i = 0; i < 4; i++)
              ExpansionTileWidget(
                title: TAppConstants.helpAndSupportFishTitle,
                subTitle: TAppConstants.helpAndSupportFishSubtitle,
                index: i,
              ),
          ]),
        ),
      ),
    );
  }
}

class ExpansionTileWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final int index;

  const ExpansionTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedIconColor: TColors.iconColor,
          iconColor: TColors.iconColor,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          shape: Border.all(color: Colors.transparent),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            Container(
              color: TColors.whiteBg,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.subTitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
        ),
        if (!_isExpanded && widget.index < 3)
          Divider(
            color: TColors.colorGrey.withOpacity(0.4),
          ),
      ],
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}






// import 'package:ecom_app/src/features/settings/presentation/widgets/custom_appbar.dart';
// import 'package:flutter/material.dart';

// class HelpAndSupportScreen extends StatefulWidget {
//   const HelpAndSupportScreen({super.key});

//   @override
//   State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
// }

// class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
//   List<Item> _data = List<Item>.generate(10, (int index) {
//     return Item(
//         expandedValue: 'Item $index', headerValue: 'Aboba number $index');
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: const CustomSettingsAppBar(
//         title: 'Help and Support',
//       ),
//       body: SingleChildScrollView(
//         child: ExpansionPanelList(
//           expandIconColor: Colors.transparent,
//           expandedHeaderPadding: EdgeInsets.zero,
//           dividerColor: Colors.transparent,
//           elevation: 0,
//           expansionCallback: (int index, bool isExpanded) {
//             setState(() {
//               _data[index].isExpanded = isExpanded;
//             });
//           },
//           children: _data.map<ExpansionPanel>((Item item) {
//             return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       Container(
//                         color: Colors.white,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(item.headerValue),
//                             Icon(isExpanded
//                                 ? Icons.expand_less
//                                 : Icons.expand_more),
//                           ],
//                         ),
//                       ),
//                       isExpanded ? const SizedBox.shrink() : const Divider()
//                     ],
//                   ),
//                 );
//               },
//               body: Container(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       Text(item.expandedValue),
//                     ],
//                   ),
//                 ),
//               ),
//               isExpanded: item.isExpanded,
//               canTapOnHeader: true,
//               backgroundColor: Colors.white,
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }
