import 'package:crud_airsoft_mrstein_api/add/add_controller.dart';
import 'package:crud_airsoft_mrstein_api/home/home_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
