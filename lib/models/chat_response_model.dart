class ChatResponseModel {
  final int statusCode;
  final String data;
  final String message;
  final bool success;

  ChatResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      statusCode: json['statusCode'],
      data: json['data'],
      message: json['message'],
      success: json['success'],
    );
  }
}