import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_controller.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditController controller = Get.find<EditController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Update Airsoft")),
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
                            child: Image(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage('${controller.uploadImageUrl}'),
                            ),
                          ),
                        ),
                  const SizedBox(height: 60.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.updateAirsoftData(
                          name: controller.nameInputController.text,
                          price: controller.priceInputController.text,
                          description:
                              controller.descriptionInputController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      child: Text('Update'),
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
