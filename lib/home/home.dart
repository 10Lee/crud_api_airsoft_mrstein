import 'dart:io';

import 'package:crud_airsoft_mrstein_api/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/variables.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Home')),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.airsoftList.length,
                itemBuilder: (context, index) {
                  final dataIndex = controller.airsoftList[index];

                  return controller.airsoftList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () => Get.toNamed('/edit', arguments: {
                            'id_input': dataIndex.id,
                            'name_input': dataIndex.name,
                            'price_input': dataIndex.price.toString(),
                            'desc_input': dataIndex.description,
                            'file_input':
                                '${Global.imageBaseUrl}/${dataIndex.photo}',
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image(
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${Global.imageBaseUrl}/${dataIndex.photo}',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(dataIndex.name.toString()),
                                        const SizedBox(height: 10.0),
                                        Text(dataIndex.price.toString()),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          dataIndex.description.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () => controller.deleteAirsoft(
                                        dataIndex, dataIndex.id),
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                },
              ),
      ),
    );
  }
}
