import 'package:vedavita/models/heartRate/heart_rate_entry.dart';

class HeartRateResponse {
  final int statusCode;
  final List<HeartRateEntry> data;
  final String message;
  final bool success;

  HeartRateResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory HeartRateResponse.fromJson(Map<String, dynamic> json) {
    return HeartRateResponse(
      statusCode: json['statusCode'],
      data: (json['data'] as List)
          .map((item) => HeartRateEntry.fromJson(item))
          .toList(),
      message: json['message'],
      success: json['success'],
    );
  }
}