import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/models/models.dart';

class ManagerFoodModel extends ChangeNotifier {
  ManagerFoodModel();

  static List<FoodModel> managerFoodModel(String responseJson) {
    final parsed = jsonDecode(responseJson);

    // ignore: inference_failure_on_untyped_parameter
    return parsed.map<FoodModel>((json) => FoodModel.fromJson(json)).toList();
  }

  // ignore: strict_raw_type
  final List<FoodModel> _basketItems = <FoodModel>[];

  List<FoodModel> get basketItems => _basketItems;

  void deleteItem(int index) {
    _basketItems.removeAt(index);
    notifyListeners();
  }

  void addItem(FoodModel model) {
    _basketItems.add(model);
    notifyListeners();
  }

  void addQuantity(int index) {
    _basketItems[index].quantity = _basketItems[index].quantity + 1;
    notifyListeners();
  }

  void minusQuantity(int index) {
    _basketItems[index].quantity = _basketItems[index].quantity - 1;
    if (_basketItems[index].quantity == 0) {
      deleteItem(index);
    }
    notifyListeners();
  }
}
