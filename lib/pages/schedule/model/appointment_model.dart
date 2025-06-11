class AppointmentsResponse {
  final bool? success;
  final String? message;
  final AppointmentData? data;

  AppointmentsResponse({this.success, this.message, this.data});

  factory AppointmentsResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return AppointmentsResponse();
    return AppointmentsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: AppointmentData.fromJson(json['data'] as Map<String, dynamic>?),
    );
  }
}

class AppointmentData {
  final List<Appointment>? pending;
  final List<Appointment>? completed;
  final List<Appointment>? upcoming;

  AppointmentData({this.pending, this.completed, this.upcoming});

  factory AppointmentData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return AppointmentData();
    return AppointmentData(
      pending: (json['pending'] as List?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>?))
          .toList(),
      completed: (json['completed'] as List?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>?))
          .toList(),
      upcoming: (json['upcoming'] as List?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );
  }
}

class Appointment {
  final String? id;
  final String? address;
  final String? date;
  final String? fromTime;
  final String? status;

  final Category? category;
  final Person? careseeker;
  final Person? caretaker;
  String? appointmentStatus;

  Appointment(
      {this.id,
      this.address,
      this.date,
      this.fromTime,
      this.status,
      this.category,
      this.careseeker,
      this.caretaker,
      this.appointmentStatus});

  factory Appointment.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Appointment();
    return Appointment(
      id: json['id'] as String?,
      address: json['address'] as String?,
      date: json['date'] as String?,
      fromTime: json['from_time'] as String?,
      status: json['status'] as String?,
      category: Category.fromJson(json['category'] as Map<String, dynamic>?),
      careseeker: Person.fromJson(json['careseeker'] as Map<String, dynamic>?),
      caretaker: Person.fromJson(json['caretaker'] as Map<String, dynamic>?),
      appointmentStatus: json['appointment_status'] as String?,
    );
  }
}

class Location {
  final String? id;
  final String? address;

  Location({this.id, this.address});

  factory Location.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Location();
    return Location(
      id: json['id'] as String?,
      address: json['address'] as String?,
    );
  }
}

class Category {
  final String? id;
  final String? name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Category();
    return Category(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}

class Person {
  final String? id;
  final String? username;
  final String? email;
  final String? phoneNo;

  Person({this.id, this.username, this.email, this.phoneNo});

  factory Person.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Person();
    return Person(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
    );
  }
}
