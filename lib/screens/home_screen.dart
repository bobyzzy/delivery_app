import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/screens/asian_food_screen.dart';
import 'package:food_delivery_app/screens/junk_food_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      primary: true,
      children: [
        const LocationTile(),
        FoodCard(
          title: 'Пекарни и кондитерские ',
          imageUrl: 'assets/images/bread.png',
          color: const Color.fromRGBO(255, 242, 210, 10),
          bottomPos: -50,
          rightPos: -70,
          onTap: () {},
        ),
        FoodCard(
          title: 'Фастфуд',
          imageUrl: 'assets/images/fast-food.png',
          color: const Color.fromRGBO(255, 235, 224, 1),
          bottomPos: -70,
          rightPos: -90,
          onTap: () {
            // ignore: inference_failure_on_instance_creation
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return JunkFoodScreen();
              },
            ));
          },
        ),
        FoodCard(
          title: 'Азиатская кухня',
          imageUrl: 'assets/images/asian-kitchen.png',
          color: const Color.fromRGBO(216, 245, 243, 1),
          bottomPos: -70,
          rightPos: -90,
          onTap: () {
            // ignore: inference_failure_on_instance_creation
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AsianFoodScreen(),
            ));
          },
        ),
        FoodCard(
          title: 'Супы',
          imageUrl: 'assets/images/soups.png',
          color: const Color.fromRGBO(239, 245, 207, 1),
          bottomPos: -70,
          rightPos: -90,
          onTap: () {},
        ),
        FoodCard(
          title: 'Холодные напитки',
          imageUrl: 'assets/images/soups.png',
          color: const Color.fromRGBO(239, 245, 207, 1),
          bottomPos: -70,
          rightPos: -90,
          onTap: () {},
        ),
      ],
    );
  }
}
