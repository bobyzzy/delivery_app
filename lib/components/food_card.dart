import 'package:flutter/material.dart';

import '../config/config.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.color,
    required this.bottomPos,
    required this.rightPos,
    required this.onTap,
  });

  final String title;
  final String imageUrl;
  final double bottomPos;
  final double rightPos;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      height: height * 0.2,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, left: 16),
              width: 190,
              child: Text(
                title,
                maxLines: 2,
                style: Config.lightTextTheme.displayLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              bottom: bottomPos,
              right: rightPos,
              child: Image.asset(
                imageUrl,
                scale: 0.8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
