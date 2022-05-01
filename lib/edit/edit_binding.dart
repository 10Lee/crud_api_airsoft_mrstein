import 'package:get/instance_manager.dart';

import 'edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
