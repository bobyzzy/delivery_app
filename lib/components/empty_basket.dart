import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';

class EmptyBasketScreen extends StatelessWidget {
  const EmptyBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 25),
        const LocationTile(),
        const SizedBox(height: 200),
        Image.asset(
          'assets/images/no-result.png',
          width: 400,
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: width * 0.9,
          child: const Text(
            'Ничего не нашлось в вашей корзине. Перейдите к выбору интересующих товаров и наполните ее для совершения покупок.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SF',
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
