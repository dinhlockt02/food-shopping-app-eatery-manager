import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/modules/add/controller.dart';
import 'package:food_shopping_app/app/modules/add/widgets/eatery_type_dropbox.dart';
import 'package:get/get.dart';

class EateryForm extends StatelessWidget {
  const EateryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addController = Get.find<AddController>();
    return Obx(
      () => Form(
        key: addController.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
              controller: addController.nameTextEdittingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name can\'t be null or empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
              controller: addController.emailTextEdittingController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Email is not valid';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
              controller: addController.usernameTextEdittingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username can\'t be null or empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Work time',
              ),
              controller: addController.worktimeTextEdittingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Work time can\'t be null or empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            EateryTypeDropbox(
                controller: addController.typeTextEdittingController),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description can\'t be null or empty';
                }
                return null;
              },
              controller: addController.descriptionTextEdittingController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Address can\'t be null or empty';
                }
                return null;
              },
              controller: addController.addressTextEdittingController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address Longitude',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    double.tryParse(value) == null) {
                  return 'Longitude is not valid';
                }
                return null;
              },
              controller: addController.longitudeTextEdittingController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address Latitude',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    double.tryParse(value) == null) {
                  return 'Latitude is not valid';
                }
                return null;
              },
              controller: addController.latitudeTextEdittingController,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Image',
                    ),
                    controller: addController.imageTextEditingController,
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                  onPressed: () {
                    addController.pickImage();
                  },
                  icon: const Icon(Icons.image),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  color: Get.theme.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (addController.mediaInfo.value != null)
              Image.memory(addController.mediaInfo.value!.data!),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(
                  40,
                ),
              ),
              onPressed: () {
                if (addController.formKey.currentState!.validate()) {
                  addController.save();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
