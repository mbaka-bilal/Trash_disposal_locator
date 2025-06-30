class ResponseModel {
  final bool success;
  final String message;
  final dynamic data;

  ResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      message: json['message'] ?? "success",
      data: json['data'],
    );
  }

}