import 'package:crud_airsoft_mrstein_api/add/add.dart';
import 'package:crud_airsoft_mrstein_api/add/add_binding.dart';
import 'package:crud_airsoft_mrstein_api/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'edit/edit.dart';
import 'edit/edit_binding.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/add',
          page: () => Add(),
          binding: AddBinding(),
        ),
        GetPage(
          name: '/edit',
          page: () => Edit(),
          binding: EditBinding(),
        ),
      ],
      initialRoute: '/',
      // initialBinding: GlobalBinding(),
    );
  }
}
