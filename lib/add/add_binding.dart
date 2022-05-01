import 'package:crud_airsoft_mrstein_api/add/add_controller.dart';
import 'package:get/get.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
