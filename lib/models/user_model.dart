class User {
  int id;
  String name;
  String email;
  String phone;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
