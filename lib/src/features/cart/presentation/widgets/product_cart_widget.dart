import 'package:ecom_app/core/presentation/widgets/count_selecter_widget.dart';
import 'package:flutter/material.dart';

class ProductCartWidget extends StatefulWidget {
  final String title;
  final String color;
  final int count;
  final dynamic price;
  final String imageUrl;
  final int productId;
  const ProductCartWidget({
    super.key,
    required this.title,
    required this.color,
    required this.count,
    required this.price,
    required this.imageUrl,
    required this.productId,
  });

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  late final TextEditingController _promoController;

  @override
  void initState() {
    _promoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 2,
                right: 5,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 20,
                  child: CountSelecterWidget(
                    count: widget.count,
                    productId: widget.productId,
                    iconWidth: 27.0,
                    iconHeight: 27.0,
                  ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(widget.title),
        SizedBox(height: 7),
        Row(
          children: [
            Text('Color: ${widget.color}'),
          ],
        ),
        Text(
          '\$${widget.price}',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
