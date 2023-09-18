import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/basket_list_view.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/models/manager_food_model.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBasketScreen(),
    );
  }
}

Widget buildBasketScreen() {
  return Consumer<ManagerFoodModel>(
    builder: (context, model, child) {
      final data = model.basketItems;
      if (model.basketItems.isNotEmpty) {
        return BasketListView(data: data);
      } else {
        return const EmptyBasketScreen();
      }
    },
  );
}
