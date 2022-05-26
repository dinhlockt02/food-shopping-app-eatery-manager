import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/modules/home/controller.dart';
import 'package:food_shopping_app/app/modules/home/widgets/eatery_item.dart';
import 'package:get/get.dart';

class EateryList extends StatelessWidget {
  const EateryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(() => ListView.separated(
          itemBuilder: (_, index) =>
              EateryItem(eatery: homeController.eateries[index]),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: homeController.eateries.length,
        ));
  }
}
