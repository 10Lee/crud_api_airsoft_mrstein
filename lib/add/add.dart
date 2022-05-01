import 'package:crud_airsoft_mrstein_api/add/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/variables.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddController controller = Get.find<AddController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Add Airsoft")),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.nameInputController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: controller.priceInputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Price'),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: controller.descriptionInputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Photo',
                    style: TextStyle(color: Colors.white60, fontSize: 16.0),
                  ),
                  const SizedBox(height: 30.0),
                  controller.fileImagePicker.value.existsSync()
                      ? InkWell(
                          onTap: () => controller.getImage(),
                          child: Container(
                            width: double.infinity,
                            height: 150.0,
                            color: Colors.grey,
                            child: Image(
                              fit: BoxFit.cover,
                              image:
                                  FileImage(controller.fileImagePicker.value),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () => controller.getImage(),
                          child: Container(
                            width: double.infinity,
                            height: 150.0,
                            color: Colors.grey,
                            child:
                                Image(image: AssetImage('assets/no_image.png')),
                          ),
                        ),
                  const SizedBox(height: 60.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.postNewAirsoft(
                          name: controller.nameInputController.text,
                          price: controller.priceInputController.text,
                          description:
                              controller.descriptionInputController.text,
                        );
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
