import 'package:flutter/material.dart';

import '../components/components.dart';

// ignore: must_be_immutable
class JunkFoodScreen extends StatelessWidget {
  JunkFoodScreen({super.key});

  List<Widget> tabsView = const [
    FoodGridView(jsonRef: 'json/fast-food.json'),
    FoodGridView(jsonRef: 'json/fast-food.json'),
    FoodGridView(jsonRef: 'json/fast-food.json'),
    FoodGridView(jsonRef: 'json/fast-food.json'),
    FoodGridView(jsonRef: 'json/fast-food.json'),
  ];

  List<Widget> tabs = [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Все меню',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Бургеры',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Шаурма',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Сеты',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Снэки',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
  ];

  String appBarTitle = 'Азиатская кухня';

  @override
  Widget build(BuildContext context) {
    return CustomScreenWithTabBar(
        appBarTitle: appBarTitle, tabs: tabs, tabsView: tabsView);
  }
}
