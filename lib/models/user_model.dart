// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  UserModel(
    this.name,
    this.email,
    this.imageUrl,
  );

  final String name;
  final String email;
  final String imageUrl;


  UserModel copyWith({
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return UserModel(
      name ?? this.name,
      email ?? this.email,
      imageUrl ?? this.imageUrl,
    );
  }
}
