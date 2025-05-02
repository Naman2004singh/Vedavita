class LoginResponse {
  final int statusCode;
  final Data data;
  final String message;
  final bool success;

  LoginResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  final User user;
  final String accessToken;
  final String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String role;
  final String profilePicture;
  final String gender;
  final bool wearableConnected;
  final int age;
  final ContactInfo contactInfo;
  final EmergencyContact emergencyContact;
  final BasicInfo basicInfo;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.profilePicture,
    required this.gender,
    required this.wearableConnected,
    required this.age,
    required this.contactInfo,
    required this.emergencyContact,
    required this.basicInfo,
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
      contactInfo: ContactInfo.fromJson(json['contactInfo']),
      emergencyContact: EmergencyContact.fromJson(json['emergencyContact']),
      basicInfo: BasicInfo.fromJson(json['basicInfo']),
    );
  }
}

class ContactInfo {
  final String phone;
  final String address;

  ContactInfo({
    required this.phone,
    required this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class EmergencyContact {
  final String name;
  final String phone;

  EmergencyContact({
    required this.name,
    required this.phone,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class BasicInfo {
  final int height;
  final int weight;
  final String bloodGroup;
  final List<String> allergies;

  BasicInfo({
    required this.height,
    required this.weight,
    required this.bloodGroup,
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
