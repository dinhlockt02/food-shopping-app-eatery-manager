import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/modules/home/widgets/eatery_list.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.offNamed(AppRoutes.ADD);
        },
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
        child: const EateryList(),
      ),
    );
  }
}
