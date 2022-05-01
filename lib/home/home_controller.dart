import 'package:crud_airsoft_mrstein_api/models/airsoft_model.dart';
import 'package:crud_airsoft_mrstein_api/services/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<AirsoftModel>> {
  RxList<AirsoftModel> airsoftList = <AirsoftModel>[].obs;

  RxBool isLoading = false.obs;

  void deleteAirsoft(AirsoftModel dataIndex, int index) {
    isLoading.value = true;
    Repository().deleteData(index).then((value) {
      airsoftList.removeWhere((element) => element.id == index);
      Get.snackbar(
        'Message',
        value.message.toString(),
      );

      isLoading.value = false;
    }).onError((error, stackTrace) {
      print("ERROR : $error");
      print("STACKTRACE : $stackTrace");
    });
  }

  void callApi() async {
    isLoading.value = true;

    Repository().getData().then((api) {
      change(api, status: RxStatus.success());
      airsoftList.addAll(api!);
      isLoading.value = false;
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    callApi();
    super.onInit();
  }
}
