import 'dart:io';
import 'package:crud_airsoft_mrstein_api/models/airsoft_model.dart';
import 'package:crud_airsoft_mrstein_api/models/post_model.dart';
import 'package:crud_airsoft_mrstein_api/models/update_model.dart';
import 'package:get/get.dart';
import '../global/variables.dart';
import '../models/delete_model.dart';

class Repository extends GetConnect {
  Future<List<AirsoftModel>?> getData() async {
    String url = '${Global.devsBaseUrl}/airsoft?page=2';

    Response response = await get(url, headers: {
      'Authorization': Global.bearer,
    });

    if (response.statusCode == 200) {
      List<dynamic> dataResults = response.body['data']['results'];
      List<AirsoftModel> convertToListOfModel =
          dataResults.map((e) => AirsoftModel.fromMap(e)).toList();
      return convertToListOfModel;
    } else {
      Get.snackbar('Error', 'status code is not 200',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<PostModel> postData({
    required String name,
    required int price,
    required String description,
    required File file,
  }) async {
    String url = '${Global.devsBaseUrl}/airsoft/add';

    final form = FormData({
      'name': name,
      'price': price,
      'description': description,
      'file': MultipartFile(file, filename: file.path.split('/').last),
    });

    Response response = await post(url, form, headers: {
      'Authorization': Global.bearer,
    });

    print('RESPONSE BODY : ${response.body}');
    if (response.body != null) {
      return PostModel.fromMap(response.body);
    } else {
      throw Exception();
    }
  }

  Future<DeleteModel> deleteData(int id) async {
    String url = '${Global.devsBaseUrl}/airsoft/delete/$id';

    Response response = await delete(url, headers: {
      'Authorization': Global.bearer,
    });

    print('RESPONSE BODY ${response.body}');
    if (response.body != '') {
      return DeleteModel.fromMap(response.body);
    } else {
      throw Exception();
    }
  }

  Future<UpdateModel> updateData({
    required int id,
    required String name,
    required int price,
    required String description,
    required File file,
  }) async {
    String url = '${Global.devsBaseUrl}/airsoft/update';

    dynamic form;

    if (file.path != '') {
      form = FormData({
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'file': MultipartFile(file, filename: file.path.split('/').last),
      });
    } else {
      form = FormData({
        'id': id,
        'name': name,
        'price': price,
        'description': description,
      });
    }

    Response response = await post(url, form, headers: {
      'Authorization': Global.bearer,
    });

    print('RESPONSE BODY : ${response.body}');
    if (response.body != null) {
      return UpdateModel.fromMap(response.body);
    } else {
      throw Exception();
    }
  }
}
