class Dashboard {
  final bool? success;
  final String? message;
  final DashboardData? data;

  Dashboard({
    this.success,
    this.message,
    this.data,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? DashboardData.fromJson(json['data']) : null,
    );
  }
}

class DashboardData {
  final int? pendingCount;
  final int? completedCount;
  final int? upcomingCount;
  final List<UpcomingMeeting>? upcomingMeetings;

  DashboardData({
    this.pendingCount,
    this.completedCount,
    this.upcomingCount,
    this.upcomingMeetings,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      pendingCount: json['pendingCount'] as int?,
      completedCount: json['completedCount'] as int?,
      upcomingCount: json['upcomingCount'] as int?,
      upcomingMeetings: (json['upcomingMeetings'] as List<dynamic>?)
          ?.map((e) => UpcomingMeeting.fromJson(e))
          .toList(),
    );
  }
}

class UpcomingMeeting {
  final String? id;
  final String? address;
  final String? date;
  final String? fromTime;
  final String? status;
  final Category? category;
  final User? careseeker;
  final User? caretaker;
  final String? appointmentStatus;

  UpcomingMeeting({
    this.id,
    this.address,
    this.date,
    this.fromTime,
    this.status,
    this.category,
    this.careseeker,
    this.caretaker,
    this.appointmentStatus,
  });

  factory UpcomingMeeting.fromJson(Map<String, dynamic> json) {
    return UpcomingMeeting(
      id: json['id'] as String?,
      address: json['address'] as String?,
      date: json['date'] as String?,
      fromTime: json['from_time'] as String?,
      status: json['status'] as String?,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      careseeker:
          json['careseeker'] != null ? User.fromJson(json['careseeker']) : null,
      caretaker:
          json['caretaker'] != null ? User.fromJson(json['caretaker']) : null,
      appointmentStatus: json['appointment_status'] as String?,
    );
  }
}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}

class User {
  final String? id;
  final String? username;
  final String? email;
  final String? phoneNo;

  User({
    this.id,
    this.username,
    this.email,
    this.phoneNo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
    );
  }
}
