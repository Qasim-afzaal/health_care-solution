class BookingResponse {
  final bool success;
  final String message;
  final BookingData data;

  BookingResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      success: json['success'],
      message: json['message'],
      data: BookingData.fromJson(json['data']),
    );
  }
}

class BookingData {
  final String message;
  final bool success;
  final BookingDetails data;

  BookingData({
    required this.message,
    required this.success,
    required this.data,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      message: json['message'],
      success: json['success'],
      data: BookingDetails.fromJson(json['data']),
    );
  }
}

class BookingDetails {
  final String id;
  final String address;
  final String fromTime;
  final String date;
  final String status;
  final Category category;
  final Careseeker careseeker;

  BookingDetails({
    required this.id,
    required this.address,
    required this.fromTime,
    required this.date,
    required this.status,
    required this.category,
    required this.careseeker,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      id: json['id'],
      address: json['address'],
      fromTime: json['from_time'],
      date: json['date'],
      status: json['status'],
      category: Category.fromJson(json['category']),
      careseeker: Careseeker.fromJson(json['careseeker']),
    );
  }
}

class Category {
  final String id;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class Careseeker {
  final String id;
  final String username;
  final String email;
  final String phoneNo;

  Careseeker({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNo,
  });

  factory Careseeker.fromJson(Map<String, dynamic> json) {
    return Careseeker(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNo: json['phone_no'],
    );
  }
}
