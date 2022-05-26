import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/modules/add/controller.dart';
import 'package:food_shopping_app/app/modules/add/widgets/eatery_form.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addController = Get.find<AddController>();
    return Scaffold(
        appBar: AppBar(
            title: addController.eatery == null
                ? const Text("ADD")
                : const Text('EDIT')),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (addController.eatery != null)
              FloatingActionButton(
                child: const Icon(Icons.password),
                onPressed: () {
                  addController.issuePassword();
                },
              ),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
              child: const Icon(Icons.home),
              onPressed: () {
                Get.offNamed(AppRoutes.HOME);
              },
            )
          ],
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
