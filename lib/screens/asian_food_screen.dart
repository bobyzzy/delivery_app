import 'package:flutter/material.dart';
import '../components/components.dart';

// ignore: must_be_immutable
class AsianFoodScreen extends StatelessWidget {
  AsianFoodScreen({super.key});

  List<Widget> tabsView = const [
    FoodGridView(jsonRef: 'json/asian-food.json'),
    FoodGridView(jsonRef: 'json/asian-food.json'),
    FoodGridView(jsonRef: 'json/asian-food.json'),
    FoodGridView(jsonRef: 'json/asian-food.json'),
    FoodGridView(jsonRef: 'json/asian-food.json'),
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
        'Салаты',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'С рисом',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'С рыбой',
        style: TextStyle(fontFamily: "SF", fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Text(
        'Роллы',
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
