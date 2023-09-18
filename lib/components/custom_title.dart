
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: 40, color: Colors.grey),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontFamily: 'SF', fontSize: 28)),
      ],
    );
  }
}