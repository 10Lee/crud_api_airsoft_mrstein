class DeleteModel {
  final bool success;
  final String message;

  DeleteModel({
    required this.success,
    required this.message,
  });

  factory DeleteModel.fromMap(dynamic map) =>
      DeleteModel(success: map['success'], message: map['message']);
}
