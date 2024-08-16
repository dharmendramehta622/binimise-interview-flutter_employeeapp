part of global;

class UsersModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phone;
  final DateTime? createdAt;
  final int? v;

  UsersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.createdAt,
    this.v,
  });

  UsersModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    DateTime? createdAt,
    int? v,
  }) =>
      UsersModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        v: v ?? this.v,
      );

  factory UsersModel.fromMap(Map<String, dynamic> json) => UsersModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        
        "firstName": "$firstName",
        "lastName": "$lastName",
        "email": "$email",
        "password": "$password",
        "phone": "$phone",
        
      };
}
