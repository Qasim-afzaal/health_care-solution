class NotificationResponse {
  final List<NotificationModel> allNotifications;
  final List<NotificationModel> unreadNotifications;

  NotificationResponse({
    required this.allNotifications,
    required this.unreadNotifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      allNotifications: (json['allNotifications'] as List<dynamic>?)
              ?.map((e) => NotificationModel.fromJson(e))
              .toList() ??
          [],
      unreadNotifications: (json['unreadNotifications'] as List<dynamic>?)
              ?.map((e) => NotificationModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allNotifications': allNotifications.map((e) => e.toJson()).toList(),
      'unreadNotifications':
          unreadNotifications.map((e) => e.toJson()).toList(),
    };
  }
}

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String type;
  final bool readStatus;
  final DateTime createdAt;
  final UserModel? user; // 👈 Added missing key

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.readStatus,
    required this.createdAt,
    this.user,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      type: json['type'] ?? '',
      readStatus: json['read_status'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'read_status': readStatus,
      'createdAt': createdAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}

class UserModel {
  final String id;
  final String username;
  final String email;
  final String profileImage;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profile_image': profileImage,
    };
  }
}
