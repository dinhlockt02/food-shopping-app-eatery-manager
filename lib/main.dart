import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_shopping_app/firebase_options.dart';
import 'package:food_shopping_app/routes/pages.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Shopping App - Eatery Manager',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
