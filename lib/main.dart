import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/config.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:provider/provider.dart';

import 'config/firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Provider.debugCheckInvalidValueType = null;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ManagerFoodModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery Application',
        theme: Config.light(),
        home: const Home(),
      ),
    );
  }
}
