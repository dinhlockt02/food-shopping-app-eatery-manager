import 'package:food_shopping_app/app/modules/add/binding.dart';
import 'package:food_shopping_app/app/modules/add/page.dart';
import 'package:food_shopping_app/app/modules/home/binding.dart';
import 'package:food_shopping_app/app/modules/home/page.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.ADD,
      page: () => const AddPage(),
      binding: AddBinding(),
    )
  ];
}
