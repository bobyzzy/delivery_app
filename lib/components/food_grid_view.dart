import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/food_grid_item.dart';
import 'package:food_delivery_app/service/fireabase_storage_service.dart';
import '../models/manager_food_model.dart';

class FoodGridView extends StatefulWidget {
  const FoodGridView({
    super.key,
    required this.jsonRef,
  });

  final String jsonRef;

  @override
  State<FoodGridView> createState() => _FoodGridViewState();
}

class _FoodGridViewState extends State<FoodGridView>
    with AutomaticKeepAliveClientMixin<FoodGridView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: FirebaseStorageManager.getDataFromStorage(widget.jsonRef),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data!;
          return Center(
            child: FoodGridItem(model: ManagerFoodModel.managerFoodModel(data)),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
