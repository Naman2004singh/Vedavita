class PostResponseModel {
  final int statusCode;
  final PostData? data;
  final String message;
  final bool success;

  PostResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      statusCode: json['statusCode'] ?? 0,
      data: json['data'] != null ? PostData.fromJson(json['data']) : null,
      message: json['message'] ?? '',
      success: json['success'] ?? false,
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
