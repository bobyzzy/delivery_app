import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.textButton});

  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Config.lightTextTheme.displaySmall?.copyWith(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
