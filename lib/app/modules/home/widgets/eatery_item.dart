import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/model/eatery.dart';
import 'package:food_shopping_app/app/modules/home/controller.dart';
import 'package:get/get.dart';

class EateryItem extends StatelessWidget {
  final Eatery eatery;

  const EateryItem({Key? key, required this.eatery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(eatery.photoUrl)),
      title: Text(eatery.name),
      subtitle: Text(
        eatery.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              homeController.deleteEatery(eatery);
            },
          ),
        ],
      ),
    );
  }
}
