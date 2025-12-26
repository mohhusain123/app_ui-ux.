class UserModel {
  final String id;
  final String name;
  final String email;
  final String nim;
  final String profileImageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.nim,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nim: json['nim'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nim': nim,
      'profileImageUrl': profileImageUrl,
    };
  }
}
