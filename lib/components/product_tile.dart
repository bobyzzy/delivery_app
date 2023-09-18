import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/config.dart';
import 'package:food_delivery_app/models/manager_food_model.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    super.key,
    required String? name,
    required String? price,
    required String? imageUrl,
    required String? gram,
    required int? quantity,
    required int? index,
  })  : _name = name,
        _price = price,
        _imageUrl = imageUrl,
        _gram = gram,
        _quantity = quantity,
        _index = index;
  final String? _name;
  final String? _price;
  final String? _imageUrl;
  final String? _gram;
  final int? _quantity;
  final int? _index;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  var count = 1;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ManagerFoodModel>();
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImage(),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    '${widget._name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Config.lightTextTheme.displayLarge
                        ?.copyWith(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                    text: TextSpan(
                  text: '${widget._price} ₽',
                  style: Config.lightTextTheme.displaySmall
                      ?.copyWith(fontSize: 20),
                  children: [
                    TextSpan(
                      text: ' · ${widget._gram} г',
                      style: Config.lightTextTheme.displaySmall
                          ?.copyWith(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 238, 236, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildCustomTextButton(
                    onPressed: () {
                      model.minusQuantity(widget._index!);
                    },
                    text: '-'),
                Text(
                  '${widget._quantity}',
                  style: Config.lightTextTheme.displaySmall
                      ?.copyWith(fontSize: 24),
                ),
                buildCustomTextButton(
                    onPressed: () {
                      model.addQuantity(widget._index!);
                      setState(() {
                        count++;
                      });
                    },
                    text: "+")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(244, 239, 231, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Image.network(
          '${widget._imageUrl}',
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  TextButton buildCustomTextButton(
      {required void Function()? onPressed, required String text}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Colors.grey,
      ),
      child: Text(text,
          style: Config.lightTextTheme.displaySmall?.copyWith(fontSize: 28)),
    );
  }
}
