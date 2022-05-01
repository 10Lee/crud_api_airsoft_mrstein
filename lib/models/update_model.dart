class UpdateModel {
  late bool success;
  late String message;

  UpdateModel({
    required this.success,
    required this.message,
  });

  UpdateModel.fromMap(dynamic map) {
    success = map['success'];
    message = map['message'];
  }

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
      };
}
