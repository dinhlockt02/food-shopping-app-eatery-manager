import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_shopping_app/app/model/eatery.dart';
import 'package:food_shopping_app/app/modules/home/widgets/eatery_list.dart';
import 'package:food_shopping_app/core/values/consts.dart';
import 'package:food_shopping_app/firebase_options.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final eateries = <Eatery>[].obs;

  final eateryCollectionRef = FirebaseFirestore.instance
      .collection(EateryCollectionConsts.EATERY_COLLECTION)
      .withConverter(
          fromFirestore: Eatery.fromFirestore,
          toFirestore: (Eatery eatery, _) => eatery.toFirestore());

  @override
  void onInit() {
    super.onInit();
    eateryCollectionRef.snapshots().listen((querySnapshot) {
      eateries.value = querySnapshot.docs
          .map((QueryDocumentSnapshot<Eatery> queryDocumentSnapshot) =>
              queryDocumentSnapshot.data())
          .toList();
    });
  }

  Future<void> deleteEatery(Eatery eatery) async {
    await eateryCollectionRef.doc(eatery.id).delete();
  }
}

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final homeController = HomeController();
}
