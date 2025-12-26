enum AssignmentStatus { notSubmitted, submitted, graded }

class AssignmentModel {
  final String id;
  final String title;
  final String description;
  final String classId;
  final DateTime deadline;
  final AssignmentStatus status;
  final int? score;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.classId,
    required this.deadline,
    required this.status,
    this.score,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      classId: json['classId'],
      deadline: DateTime.parse(json['deadline']),
      status: AssignmentStatus.values[json['status']],
      score: json['score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'classId': classId,
      'deadline': deadline.toIso8601String(),
      'status': status.index,
      'score': score,
    };
  }
}
