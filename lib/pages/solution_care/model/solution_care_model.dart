class ServiceCategoriesResponse {
  final bool success;
  final String message;
  final List<ServiceCategory> data;

  ServiceCategoriesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ServiceCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return ServiceCategoriesResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ServiceCategory.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.map((e) => e.toJson()).toList(),
      };
}

class ServiceCategory {
  final String id;
  final String name;
  final String description;

  ServiceCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
