import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/model/address_eatery.dart';
import 'package:food_shopping_app/app/model/eatery.dart';
import 'package:food_shopping_app/core/values/consts.dart';
import 'package:food_shopping_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AddController extends GetxController {
  final imageRef = FirebaseStorage.instance.ref().child(FIRESTORE_IMAGE_PATH);
  final formKey = GlobalKey<FormState>();
  final mediaInfo = Rx<MediaInfo?>(null);

  final eateryCollectionRef = FirebaseFirestore.instance
      .collection(EateryCollectionConsts.EATERY_COLLECTION)
      .withConverter(
          fromFirestore: Eatery.fromFirestore,
          toFirestore: (Eatery eatery, _) => eatery.toFirestore());

  final imageTextEditingController = TextEditingController();
  final nameTextEdittingController = TextEditingController();
  final emailTextEdittingController = TextEditingController();
  final usernameTextEdittingController = TextEditingController();
  final worktimeTextEdittingController = TextEditingController();
  final typeTextEdittingController = TextEditingController();
  final descriptionTextEdittingController = TextEditingController();
  final addressTextEdittingController = TextEditingController();
  final longitudeTextEdittingController = TextEditingController();
  final latitudeTextEdittingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    imageTextEditingController.dispose();
    nameTextEdittingController.dispose();
    emailTextEdittingController.dispose();
    usernameTextEdittingController.dispose();
    worktimeTextEdittingController.dispose();
    typeTextEdittingController.dispose();
    descriptionTextEdittingController.dispose();
    addressTextEdittingController.dispose();
    longitudeTextEdittingController.dispose();
    latitudeTextEdittingController.dispose();
  }

  Future<void> pickImage() async {
    mediaInfo.value = await ImagePickerWeb.getImageInfo;
    imageTextEditingController.text = mediaInfo.value?.fileName ?? "";
  }

  Future<void> save() async {
    try {
      await addEatery();
    } on Exception catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar("Save error", e.toString());
    }
  }

  Future<void> addEatery() async {
    if (mediaInfo.value == null) throw Exception("Image not found");
    final uploadImageUrl = await uploadImage(mediaInfo.value!);
    final eatery = Eatery(
      id: "",
      addressEatery: AddressEatery(
          address: addressTextEdittingController.text,
          geoPointLocation: GeoPoint(
              double.parse(latitudeTextEdittingController.text),
              double.parse(longitudeTextEdittingController.text))),
      averageRatingCount: 0,
      description: descriptionTextEdittingController.text,
      email: emailTextEdittingController.text,
      name: nameTextEdittingController.text,
      password: "",
      photoUrl: uploadImageUrl,
      username: usernameTextEdittingController.text,
      workTime: worktimeTextEdittingController.text,
      type: EateryType(value: typeTextEdittingController.text),
    );

    await eateryCollectionRef.add(eatery);
    Get.offNamed(AppRoutes.HOME);
  }

  Future<String> uploadImage(MediaInfo mediaInfo) async {
    if (mediaInfo.fileName == null || mediaInfo.data == null)
      throw Exception(
          "Upload image failed:\n reason: filename not found or invalid image data");
    final fileName = DateTime.now().toIso8601String() + mediaInfo.fileName!;
    final fileImageRef = imageRef.child(fileName);
    await fileImageRef.putData(mediaInfo.data!);
    return await fileImageRef.getDownloadURL();
  }
}
