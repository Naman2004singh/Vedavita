class RegisterResponse {
  int? statusCode;
  UserData? data;
  String? message;
  bool? success;

  RegisterResponse({
    this.statusCode,
    this.data,
    this.message,
    this.success,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      statusCode: json['statusCode'],
      data: UserData.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'data': data?.toJson(),
      'message': message,
      'success': success,
    };
  }
}

class UserData {
  String? id;
  String? fullName;
  String? email;
  String? role;
  String? profilePicture;
  String? gender;
  bool? wearableConnected;
  BasicInfo? basicInfo;

  UserData({
    this.id,
    this.fullName,
    this.email,
    this.role,
    this.profilePicture,
    this.gender,
    this.wearableConnected,
    this.basicInfo,
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

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'role': role,
      'profilePicture': profilePicture,
      'gender': gender,
      'wearableConnected': wearableConnected,
      'basicInfo': basicInfo?.toJson(),
    };
  }
}

class BasicInfo {
  int? height;
  int? weight;
  String? bloodGroup;
  List<String>? allergies;

  BasicInfo({
    this.height,
    this.weight,
    this.bloodGroup,
    this.allergies,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      height: json['height'],
      weight: json['weight'],
      bloodGroup: json['bloodGroup'],
      allergies: List<String>.from(json['allergies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bloodGroup': bloodGroup,
      'allergies': allergies,
    };
  }
}
