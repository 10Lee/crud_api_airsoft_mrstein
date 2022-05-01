import 'dart:convert';
import 'dart:io';

import 'package:crud_airsoft_mrstein_api/models/post_model.dart';
import 'package:crud_airsoft_mrstein_api/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../home/home_controller.dart';

class AddController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late TextEditingController nameInputController;
  late TextEditingController priceInputController;
  late TextEditingController descriptionInputController;

  Rx<File> fileImagePicker = Rx(File(""));
  final ImagePicker _imagePicker = ImagePicker();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    nameInputController = TextEditingController();
    priceInputController = TextEditingController();
    descriptionInputController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    nameInputController.dispose();
    priceInputController.dispose();
    descriptionInputController.dispose();
    super.dispose();
  }

  void getImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    fileImagePicker.value = File(image!.path);
  }

  void postNewAirsoft({
    required String name,
    required String price,
    required String description,
  }) {
    isLoading.value = true;
    int intPrice = int.parse(price);

    Repository()
        .postData(
      name: name,
      price: intPrice,
      description: description,
      file: fileImagePicker.value,
    )
        .then((PostModel result) {
      print(result.message);
      if (result.success == true) {
        print('POST SUCCESS');
        homeController.airsoftList.add(result.data);
        isLoading.value = false;
        Get.offAllNamed('/');
      }
    }).onError((error, stackTrace) {
      print('ERROR : $error');
      print('STACKTRACE : $stackTrace');
    });
  }
}
