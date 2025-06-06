class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? email;
  String? phoneNo;
  String? username;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? accessToken;
  Location? location;

  Data({
    this.id,
    this.email,
    this.phoneNo,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.accessToken,
    this.location,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNo = json['phone_no'];
    username = json['username'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
    accessToken = json['access_token'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_no': phoneNo,
      'username': username,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'role': role,
      'access_token': accessToken,
      'location': location?.toJson(),
    };
  }
}

class Location {
  String? address;
  double? latitude;
  double? longitude;

  Location({this.address, this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['location_address'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'location_address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
