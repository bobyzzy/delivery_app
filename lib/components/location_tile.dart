import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/config.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
  });

  String getImage() {
    final imagePath = FirebaseAuth.instance.currentUser?.photoURL;

    return imagePath ??
        'https://firebasestorage.googleapis.com/v0/b/my-own-delivery-app.appspot.com/o/images%2Ffast-food%2Fdelicious-hamburger.png?alt=media&token=6c4f254f-1936-45b1-9eb5-8800b9bd43e5';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/icons/location.png',
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Санкт-Петербург',
                    maxLines: 1,
                    style: Config.lightTextTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 8),
                  const Text('12/09/2023',
                      style: TextStyle(fontFamily: "SF", fontSize: 18)),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(getImage()),
          ),
        ],
      ),
    );
  }
}
