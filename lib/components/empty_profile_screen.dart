import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/screens/log_in_screen.dart';

class EmptyProfileScreen extends StatelessWidget {
  const EmptyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        Center(
          child: Image.asset('assets/images/empty-user.png',
              width: 300, height: 300),
        ),
        const SizedBox(height: 30),
        const Text(
          'Для продолжения, пожалуйста, авторизуйтесь, нажав кнопку \'Войти\'.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "SF",
            fontSize: 24,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 50),
        CustomButton(
          textButton: 'Войти',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LogInScreen()));
          },
        ),
      ],
    );
  }
}
