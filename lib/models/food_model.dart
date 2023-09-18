import 'package:flutter/material.dart';

class FoodModel extends ChangeNotifier {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String gram;
  final String imageUrl;
  int quantity = 1;

  FoodModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.gram,
    required this.imageUrl,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        price: json['price'],
        gram: json['gram'],
        imageUrl: json['imageUrl']);
  }

  FoodModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? price,
    String? gram,
    String? imageUrl,
  }) {
    return FoodModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: title ?? this.subtitle,
      price: price ?? this.price,
      gram: gram ?? this.gram,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
