import 'dart:convert';

List<User> welcomeFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    this.phone,
    this.birthday,
  });

  int? id;
  String name;
  String lastname;
  String email;
  String password;
  String? phone;
  DateTime? birthday;

  constructor(id, name, lastname, email, password, phone, birthday) {
    this.id = id ?? 0;
    this.name = name ?? '';
    this.lastname = lastname ?? '';
    this.email = email ?? '';
    this.password = password ?? '';
    this.phone = phone ?? '';
    this.birthday = birthday ?? '';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "phone": phone,
        "birthday": birthday == null
            ? null
            : "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
      };
}
