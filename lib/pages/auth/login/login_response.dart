class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json.containsKey('success') ? json['success'] : null;
    message = json.containsKey('message') ? json['message'] : null;
    data = json.containsKey('data') && json['data'] != null
        ? Data.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  String? id;
  String? email;
  String? username;
  String? phoneNo;
  String? profileImage;
  String? dob;
  String? gender;
  String? nationality;
  String? address;
  String? country;
  String? firstName;
  String? lastName;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? accessToken;
  Location? location;

  Data({
    this.id,
    this.email,
    this.username,
    this.phoneNo,
    this.profileImage,
    this.dob,
    this.gender,
    this.nationality,
    this.address,
    this.country,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.accessToken,
    this.location,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json.containsKey('id') ? json['id'] : null;
    email = json.containsKey('email') ? json['email'] : null;
    username = json.containsKey('username') ? json['username'] : null;
    phoneNo = json.containsKey('phone_no') ? json['phone_no'] : null;
    profileImage =
        json.containsKey('profile_image') ? json['profile_image'] : null;
    dob = json.containsKey('dob') ? json['dob'] : null;
    gender = json.containsKey('gender') ? json['gender'] : null;
    nationality = json.containsKey('nationality') ? json['nationality'] : null;
    address = json.containsKey('address') ? json['address'] : null;
    country = json.containsKey('country') ? json['country'] : null;
    firstName = json.containsKey('first_name') ? json['first_name'] : null;
    lastName = json.containsKey('last_name') ? json['last_name'] : null;
    createdAt = json.containsKey('createdAt') ? json['createdAt'] : null;
    updatedAt = json.containsKey('updatedAt') ? json['updatedAt'] : null;
    role = json.containsKey('role') ? json['role'] : null;
    accessToken =
        json.containsKey('access_token') ? json['access_token'] : null;
    location = json.containsKey('location') && json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone_no': phoneNo,
      'profile_image': profileImage,
      'dob': dob,
      'gender': gender,
      'nationality': nationality,
      'address': address,
      'country': country,
      'first_name': firstName,
      'last_name': lastName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'role': role,
      'access_token': accessToken,
      'location': location?.toJson(),
    };
  }
}

class Location {
  String? id;
  String? lat;
  String? long;
  String? locationAddress;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Location({
    this.id,
    this.lat,
    this.long,
    this.locationAddress,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  Location.fromJson(Map<String, dynamic> json) {
    id = json.containsKey('id') ? json['id'] : null;
    lat = json.containsKey('lat') ? json['lat'] : null;
    long = json.containsKey('long') ? json['long'] : null;
    locationAddress =
        json.containsKey('location_address') ? json['location_address'] : null;
    userId = json.containsKey('user_id') ? json['user_id'] : null;
    createdAt = json.containsKey('createdAt') ? json['createdAt'] : null;
    updatedAt = json.containsKey('updatedAt') ? json['updatedAt'] : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lat': lat,
      'long': long,
      'location_address': locationAddress,
      'user_id': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
