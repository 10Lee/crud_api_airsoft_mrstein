import 'package:crud_airsoft_mrstein_api/models/airsoft_model.dart';

class PostModel {
  late String message;
  late bool success;
  late AirsoftModel data;

  PostModel({
    required this.message,
    required this.success,
    required this.data,
  });

  PostModel.fromMap(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];

    if (json['data'] != null) {
      data = AirsoftModel.fromMap(json['data']);
    }
  }
}
