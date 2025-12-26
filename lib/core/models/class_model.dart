class ClassModel {
  final String id;
  final String name;
  final String lecturer;
  final String description;
  final int progress; // 0-100
  final String imageUrl;

  ClassModel({
    required this.id,
    required this.name,
    required this.lecturer,
    required this.description,
    required this.progress,
    required this.imageUrl,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      name: json['name'],
      lecturer: json['lecturer'],
      description: json['description'],
      progress: json['progress'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lecturer': lecturer,
      'description': description,
      'progress': progress,
      'imageUrl': imageUrl,
    };
  }
}
