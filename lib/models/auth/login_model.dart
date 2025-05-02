class LoginResponse {
  int? statusCode;
  Data? data;
  String? message;
  bool? success;

  LoginResponse({
    this.statusCode,
    this.data,
    this.message,
    this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      // data: Data.fromJson(json['data']),
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      // user: User.fromJson(json['user']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? role;
  String? profilePicture;
  String? gender;
  bool? wearableConnected;
  int? age;
  ContactInfo? contactInfo;
  EmergencyContact? emergencyContact;
  BasicInfo? basicInfo;

  User({
    this.id,
    this.fullName,
    this.email,
    this.role,
    this.profilePicture,
    this.gender,
    this.wearableConnected,
    this.age,
    this.contactInfo,
    this.emergencyContact,
    this.basicInfo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      role: json['role'],
      profilePicture: json['profilePicture'],
      gender: json['gender'],
      wearableConnected: json['wearableConnected'],
      age: json['age'],
      // contactInfo: ContactInfo.fromJson(json['contactInfo']),
      // emergencyContact: EmergencyContact.fromJson(json['emergencyContact']),
      // basicInfo: BasicInfo.fromJson(json['basicInfo']),
      contactInfo: json['contactInfo'] != null ? ContactInfo.fromJson(json['contactInfo']) : null,
    emergencyContact: json['emergencyContact'] != null ? EmergencyContact.fromJson(json['emergencyContact']) : null,
    basicInfo: json['basicInfo'] != null ? BasicInfo.fromJson(json['basicInfo']) : null,
    );
  }
}

class ContactInfo {
  String? phone;
  String? address;

  ContactInfo({
    this.phone,
    this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class EmergencyContact {
  String? name;
  String? phone;

  EmergencyContact({
    this.name,
    this.phone,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      name: json['name'],
      phone: json['phone'],
    );
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
      // allergies: List<String>.from(json['allergies']),
      allergies: json['allergies'] != null
        ? List<String>.from(json['allergies'])
        : [],
    );
  }
}
