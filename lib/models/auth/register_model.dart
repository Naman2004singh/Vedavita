class RegisterResponse {
  final int statusCode;
  final UserData data;
  final String message;
  final bool success;

  RegisterResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      statusCode: json['statusCode'],
      data: UserData.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class UserData {
  final String id;
  final String fullName;
  final String email;
  final String role;
  final String profilePicture;
  final String gender;
  final bool wearableConnected;
  final BasicInfo basicInfo;

  UserData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.profilePicture,
    required this.gender,
    required this.wearableConnected,
    required this.basicInfo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      role: json['role'],
      profilePicture: json['profilePicture'],
      gender: json['gender'],
      wearableConnected: json['wearableConnected'],
      basicInfo: BasicInfo.fromJson(json['basicInfo']),
    );
  }
}

class BasicInfo {
  final int height;
  final int weight;
  final String? bloodGroup;
  final List<String> allergies;

  BasicInfo({
    required this.height,
    required this.weight,
    this.bloodGroup,
    required this.allergies,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      height: json['height'],
      weight: json['weight'],
      bloodGroup: json['bloodGroup'],
      allergies: List<String>.from(json['allergies']),
    );
  }
}
