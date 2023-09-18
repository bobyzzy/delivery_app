import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';

import 'components.dart';

// ignore: must_be_immutable
class BasketListView extends StatelessWidget {
  BasketListView({super.key, required this.data});

  List<FoodModel> data;

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (var element in data) {
      totalPrice += int.parse(element.price);

      totalPrice *= element.quantity;
    }
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      addAutomaticKeepAlives: true,
      children: [
        const LocationTile(),
        SizedBox(
          height: MediaQuery.of(context).size.height - 280,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            primary: false,
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductTile(
                name: data[index].title,
                price: data[index].price,
                gram: data[index].gram,
                imageUrl: data[index].imageUrl,
                quantity: data[index].quantity,
                index: index,
              );
            },
          ),
        ),
        CustomButton(
          textButton: 'Оплатить     $totalPrice ₽',
          onPressed: () {},
        )
      ],
    );
  }
}
