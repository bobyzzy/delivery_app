import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/basket_screen.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/profile_screen.dart';
import 'package:food_delivery_app/screens/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const BasketScreen(),
    const ProfileScreen(),
  ];

  var _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png'),
              label: 'Главная',
              activeIcon: Image.asset(
                'assets/icons/home.png',
                color: const Color.fromARGB(253, 51, 100, 224),
              )),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/search-normal.png'),
              label: 'Поиск',
              activeIcon: Image.asset(
                'assets/icons/search-normal.png',
                color: const Color.fromARGB(253, 51, 100, 224),
              )),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/bag.png'),
              label: 'Корзина',
              activeIcon: Image.asset(
                'assets/icons/bag.png',
                color: const Color.fromARGB(253, 51, 100, 224),
              )),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/profile-circle.png'),
              label: 'Аккаунт',
              activeIcon: Image.asset(
                'assets/icons/profile-circle.png',
                color: const Color.fromARGB(253, 51, 100, 224),
              )),
        ],
      ),
    );
  }
}
