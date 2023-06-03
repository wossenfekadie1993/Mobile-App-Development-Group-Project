class User {
  final String userId;
  final String fullname;
  final String email;
  final String password;
  final String role;

  User({
    required this.userId,
    required this.fullname,
    required this.email,
    required this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      fullname: json['fullname'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullname': fullname,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
