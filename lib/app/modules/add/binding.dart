import 'package:food_shopping_app/app/modules/add/controller.dart';
import 'package:get/get.dart';

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
