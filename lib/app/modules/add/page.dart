import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/modules/add/widgets/eatery_form.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ADD")),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.home),
          onPressed: () {
            Get.offNamed(AppRoutes.HOME);
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: const EateryForm(),
            ),
          ),
        ));
  }
}
