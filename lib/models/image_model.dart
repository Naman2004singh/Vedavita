class PostResponseModel {
  final bool success;
  final String message;
  final int statusCode;
  final PostData? data;

  PostResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: json['data'] != null ? PostData.fromJson(json['data']) : null,
    );
  }
}

class PostData {
  final String id;
  final String patient;
  final String image;
  final double result;
  final String createdAt;
  final String updatedAt;
  final int v;

  PostData({
    required this.id,
    required this.patient,
    required this.image,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      id: json['_id'] ?? '',
      patient: json['patient'] ?? '',
      image: json['image'] ?? '',
      result: (json['result'] ?? 0).toDouble(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}
